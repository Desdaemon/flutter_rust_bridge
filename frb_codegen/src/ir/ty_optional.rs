use crate::ir::*;
use crate::target::Target;

crate::ir! {
#[no_serde]
pub struct IrTypeOptional {
    pub inner: Box<IrType>,
}
}

crate::derive_serde_inner_as_newtype!(IrTypeOptional);

impl IrTypeOptional {
    #[inline]
    pub fn new(ptr: IrType) -> Self {
        Self {
            inner: Box::new(ptr),
        }
    }
}

impl IrTypeTrait for IrTypeOptional {
    fn safe_ident(&self) -> String {
        format!("opt_{}", self.inner.safe_ident())
    }

    fn rust_wire_type(&self, target: Target) -> String {
        if self.inner.needs_box(target) {
            if target.is_wasm() {
                "JsValue".into()
            } else {
                self.inner.rust_wire_type(target)
            }
        } else {
            format!("Option<{}>", self.inner.rust_wire_type(target))
        }
    }

    fn rust_api_type(&self) -> String {
        format!("Option<{}>", self.inner.rust_api_type())
    }

    fn dart_wire_type(&self, target: Target) -> String {
        if target.is_wasm() {
            format!("{}?", self.inner.dart_wire_type(target))
        } else if self.inner.needs_indirection(target) {
            format!(
                "ffi.Pointer<{}>",
                self.inner.dart_wire_prefer_native(target)
            )
        } else {
            self.inner.dart_wire_type(target)
        }
    }

    fn dart_api_type(&self) -> String {
        format!("{}?", self.inner.dart_api_type())
    }

    fn rust_wire_is_pointer(&self, target: Target) -> bool {
        !target.is_wasm() || self.inner.rust_wire_is_pointer(target)
    }

    fn visit_children_types<F: FnMut(&IrType) -> bool>(&self, f: &mut F, ir_file: &IrFile) {
        if self.inner.needs_indirection(Target::Io) {
            IrType::Boxed(IrTypeBoxed {
                exist_in_real_api: false,
                inner: self.inner.clone(),
            })
            .visit_types(f, ir_file);
        } else {
            self.inner.visit_types(f, ir_file);
        }
    }
}
