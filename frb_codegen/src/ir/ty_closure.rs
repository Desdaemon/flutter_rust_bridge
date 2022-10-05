use std::collections::hash_map::DefaultHasher;
use std::hash::Hasher;

use itertools::Itertools;

use crate::ir::*;
use crate::target::Target;

#[derive(Debug, Clone)]
pub struct IrTypeClosure {
    pub kind: IrTypeClosures,
    pub args: Vec<IrType>,
    pub returns: Option<Box<IrType>>,
}

#[derive(Debug, Clone, Copy)]
pub enum IrTypeClosures {
    Fn,
    FnMut,
    FnOnce,
}

impl IrTypeClosures {
    pub const fn trait_name(&self) -> &'static str {
        match self {
            Self::Fn => "Fn",
            Self::FnMut => "FnMut",
            Self::FnOnce => "FnOnce",
        }
    }
    pub fn from_str(repr: &str) -> Option<Self> {
        Some(match repr {
            "Fn" => Self::Fn,
            "FnMut" => Self::FnMut,
            "FnOnce" => Self::FnOnce,
            _ => return None,
        })
    }
}

impl IrTypeTrait for IrTypeClosure {
    fn visit_children_types<F: FnMut(&IrType) -> bool>(&self, f: &mut F, ir_file: &IrFile) {
        for arg in &self.args {
            arg.visit_types(f, ir_file);
        }
        if let Some(returns) = self.returns.as_deref() {
            returns.visit_types(f, ir_file);
        }
    }

    fn safe_ident(&self) -> String {
        let mut hasher = DefaultHasher::new();
        #[inline]
        fn hash(hasher: &mut impl Hasher, ty: &IrType) {
            let ident = ty.safe_ident();
            hasher.write_usize(ident.len());
            hasher.write(ident.as_bytes());
        }
        for arg in &self.args {
            hash(&mut hasher, arg);
        }
        if let Some(returns) = self.returns.as_deref() {
            hash(&mut hasher, returns)
        }
        format!("closure_{}", radix_fmt::radix_36(hasher.finish()))
    }

    fn dart_api_type(&self) -> String {
        format!(
            "{} Function({})",
            match self.returns.as_deref() {
                Some(returns) => returns.dart_api_type(),
                _ => "void".into(),
            },
            self.args.iter().map(<_>::dart_api_type).join(", ")
        )
    }

    fn dart_wire_type(&self, target: Target) -> String {
        match target {
            Target::Io => {
                format!(
                    "ffi.Pointer<ffi.NativeFunction<{} Function({})>>",
                    match self.returns.as_deref() {
                        Some(returns) => returns.dart_wire_type(target),
                        _ => "ffi.Void".into(),
                    },
                    self.args
                        .iter()
                        .map(|arg| arg.dart_wire_type(target))
                        .join(", ")
                )
            }
            Target::Wasm => self.dart_api_type(),
            _ => "".into(),
        }
    }

    fn rust_wire_type(&self, target: Target) -> String {
        match target {
            Target::Io => {
                format!(
                    "support::Local<extern \"C\" fn({}) -> {}>",
                    self.args
                        .iter()
                        .map(|arg| arg.rust_wire_type(target))
                        .join(", "),
                    match self.returns.as_deref() {
                        Some(returns) => returns.rust_wire_type(target),
                        _ => "()".into(),
                    }
                )
            }
            Target::Wasm => "js_sys::Function".into(),
            _ => "".into(),
        }
    }

    fn rust_api_type(&self) -> String {
        format!(
            "impl {}({}) -> {}",
            self.kind.trait_name(),
            self.args.iter().map(<_>::rust_api_type).join(", "),
            match self.returns.as_deref() {
                Some(returns) => returns.rust_api_type(),
                _ => "()".into(),
            }
        )
    }
}
