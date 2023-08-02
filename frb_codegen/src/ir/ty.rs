use crate::{ir::*, target::Target};
use enum_dispatch::enum_dispatch;
use std::{borrow::Cow, collections::HashSet};
use IrType::*;

crate::ir! {
/// Remark: "Ty" instead of "Type", since "type" is a reserved word in Rust.
#[enum_dispatch(IrTypeTrait)]
pub enum IrType {
    Primitive(IrTypePrimitive),
    Delegate(IrTypeDelegate),
    PrimitiveList(IrTypePrimitiveList),
    Optional(IrTypeOptional),
    GeneralList(IrTypeGeneralList),
    StructRef(IrTypeStructRef),
    Boxed(IrTypeBoxed),
    EnumRef(IrTypeEnumRef),
    SyncReturn(IrTypeSyncReturn),
    DartOpaque(IrTypeDartOpaque),
    RustOpaque(IrTypeRustOpaque),
    Dynamic(IrTypeDynamic),
    Record(IrTypeRecord),
    Unencodable(IrTypeUnencodable),
}
}

impl IrType {
    pub fn visit_types<F: FnMut(&IrType) -> bool>(&self, f: &mut F, ir_file: &IrFile) {
        if f(self) {
            return;
        }
        self.visit_children_types(f, ir_file);
    }

    pub fn distinct_types(&self, ir_file: &IrFile) -> Vec<IrType> {
        let mut seen_idents = HashSet::new();
        let mut ans = Vec::new();
        self.visit_types(
            &mut |ty| {
                let ident = ty.safe_ident();
                let contains = seen_idents.contains(&ident);
                if !contains {
                    seen_idents.insert(ident);
                    ans.push(ty.clone());
                }
                contains
            },
            ir_file,
        );
        ans
    }

    #[inline]
    pub fn dart_required_modifier(&self) -> &'static str {
        match self {
            Optional(_) => "",
            _ => "required ",
        }
    }

    /// Additional indirection for types put behind a vector
    #[inline]
    pub fn rust_ptr_modifier(&self) -> &'static str {
        match self {
            Optional(_) | Delegate(IrTypeDelegate::String) => "*mut ",
            _ => "",
        }
    }

    #[inline]
    pub fn as_primitive(&self) -> Option<&IrTypePrimitive> {
        match self {
            Primitive(repr) | Delegate(IrTypeDelegate::PrimitiveEnum { repr, .. }) => Some(repr),
            #[cfg(feature = "chrono")]
            Delegate(IrTypeDelegate::Time(_)) => Some(&IrTypePrimitive::I64),
            _ => None,
        }
    }

    #[inline]
    pub fn is_primitive(&self) -> bool {
        self.as_primitive().is_some()
    }

    #[inline]
    pub fn is_array(&self) -> bool {
        matches!(self, IrType::Delegate(IrTypeDelegate::Array(_)))
    }

    #[inline]
    pub fn is_struct(&self) -> bool {
        matches!(self, StructRef(_) | EnumRef(_) | Record(_))
    }

    #[inline]
    pub fn is_rust_opaque(&self) -> bool {
        matches!(self, RustOpaque(_))
    }

    #[inline]
    pub fn is_sync_rust_opaque(&self) -> bool {
        match self {
            SyncReturn(sync) => sync.clone().into_inner().is_rust_opaque(),
            _ => false,
        }
    }

    #[inline]
    pub fn is_dart_opaque(&self) -> bool {
        matches!(self, DartOpaque(_))
    }

    /// In WASM, these types belong to the JS scope-local heap, **NOT** the Rust heap and
    /// therefore do not implement [Send].
    pub fn is_js_value(&self) -> bool {
        match self {
            | Self::GeneralList(..) // JsArray
            | Self::Delegate(IrTypeDelegate::StringList) // special: JsArray
            | Self::StructRef(_)
            | Self::EnumRef(_)
            | Self::RustOpaque(_)
            | Self::DartOpaque(_)
            | Self::Record(_) => true,
            Self::Boxed(IrTypeBoxed { inner, .. }) => inner.is_js_value(),
            _ => false,
        }
    }

    /// Whether the inner type needs a layer of indirection,
    /// i.e. *mut T on native and JsValue on WASM platforms.
    ///
    /// Used by [Optional].
    pub fn needs_box(&self, target: Target) -> bool {
        // Guidance for adding new checks:
        //
        // WASM:
        // - Consult the wasm-bindgen docs, is Option<T> valid?
        // - If not, this should be true.
        //
        // IO:
        // - Is this type representable by nullptr?
        // - If not, this should be true.
        match self {
            // nullptr / Option<Box<[u8]>>
            PrimitiveList(..) => !target.is_wasm(),
            // wire_String[List] / JsValue
            // Delegate(IrTypeDelegate::String | IrTypeDelegate::StringList) => true,
            Delegate(IrTypeDelegate::String) => !target.is_wasm(),
            Delegate(IrTypeDelegate::StringList) => true,
            StructRef(..) | EnumRef(..) | DartOpaque(..) | RustOpaque(..) | Primitive(..)
            | Record(..) => true,
            // *mut T / ?
            Boxed(ir) => !target.is_wasm() || ir.inner.needs_box(target),
            // *mut list_.. // JsArray
            GeneralList(..) => true,
            Delegate(ir) => ir.get_delegate().needs_box(target),
            Optional(..) | SyncReturn(..) | Dynamic(..) | Unencodable(..) => unreachable!(),
        }
    }

    #[inline]
    pub fn dart_wire_prefer_native(&self, target: Target) -> Cow<str> {
        if let Some(prim) = self.as_primitive() {
            prim.dart_native_type().into()
        } else {
            self.dart_wire_type(target).into()
        }
    }

    #[inline]
    pub fn needs_indirection(&self, target: Target) -> bool {
        !self.rust_wire_is_pointer(target) && self.needs_box(target)
    }

    pub fn wrapper_struct<'file>(&self, ir_file: &'file IrFile) -> Option<&'file str> {
        match self {
            StructRef(ir) => ir.get(ir_file).wrapper_name.as_deref(),
            EnumRef(ir) => ir.get(ir_file).wrapper_name.as_deref(),
            _ => None,
        }
    }

    pub fn mirrored_nested(&self) -> Option<String> {
        match self {
            Self::StructRef(struct_ref) => Some(struct_ref.name.clone()),
            Self::Boxed(IrTypeBoxed { inner, .. }) => inner.mirrored_nested(),
            _ => None,
        }
    }
}

#[enum_dispatch]
pub trait IrTypeTrait {
    fn visit_children_types<F: FnMut(&IrType) -> bool>(&self, f: &mut F, ir_file: &IrFile);
    fn safe_ident(&self) -> String;
    fn dart_api_type(&self) -> String;
    fn dart_wire_type(&self, target: Target) -> String;
    fn rust_api_type(&self) -> String;
    fn rust_wire_type(&self, target: Target) -> String;
    fn intodart_type(&self, _ir_file: &IrFile) -> String {
        self.rust_api_type()
    }

    fn rust_wire_modifier(&self, target: Target) -> String {
        if self.rust_wire_is_pointer(target) {
            "*mut ".to_string()
        } else {
            "".to_string()
        }
    }

    fn rust_wire_is_pointer(&self, _target: Target) -> bool {
        false
    }

    fn dart_param_type(&self) -> &'static str {
        "dynamic"
    }
}

pub fn optional_boundary_index(fields: &[IrField]) -> Option<usize> {
    fields
        .iter()
        .enumerate()
        .find(|(_, field)| field.is_optional())
        .and_then(|(idx, _)| {
            fields[idx..]
                .iter()
                .all(|field| field.is_optional())
                .then_some(idx)
        })
}
