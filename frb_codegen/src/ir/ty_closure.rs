use crate::Target;
use itertools::Itertools;

use crate::ir::*;

#[derive(Clone, Debug)]
pub struct IrTypeClosure {
    pub args: Vec<IrType>,
    pub ret: Option<Box<IrType>>,
}

impl IrTypeTrait for IrTypeClosure {
    fn visit_children_types<F: FnMut(&IrType) -> bool>(&self, f: &mut F, _ir_file: &IrFile) {
        for arg in &self.args {
            f(arg);
        }
        if let Some(ret) = self.ret.as_deref() {
            f(ret);
        }
    }

    fn safe_ident(&self) -> String {
        Some(String::from("fn"))
            .into_iter()
            .chain(self.args.iter().map(IrType::safe_ident))
            .chain(
                self.ret
                    .as_ref()
                    .map(|ret| format!("ret_{}", ret.safe_ident())),
            )
            .join("_")
    }

    fn dart_api_type(&self) -> String {
        format!(
            "{} Function({})",
            if let Some(ret) = &self.ret {
                ret.dart_api_type()
            } else {
                "void".into()
            },
            self.args.iter().map(IrType::dart_api_type).join(", "),
        )
    }

    fn dart_wire_type(&self, target: Target) -> String {
        match target {
            Target::Io => {
                format!(
                    "ffi.Pointer<ffi.NativeFunction<{} Function({})>>",
                    if let Some(ret) = &self.ret {
                        ret.dart_ffi_wire_type()
                    } else {
                        "ffi.Void".into()
                    },
                    self.args
                        .iter()
                        .map(|arg| arg.dart_ffi_wire_type())
                        .join(", ")
                )
            }
            _ => self.dart_api_type(),
        }
    }

    fn rust_api_type(&self) -> String {
        format!(
            "fn({}){}",
            self.args.iter().map(IrType::rust_api_type).join(", "),
            self.ret
                .as_ref()
                .map(|ret| format!("-> {}", ret.rust_api_type()))
                .unwrap_or_default()
        )
    }

    fn rust_wire_type(&self, target: Target) -> String {
        match target {
            Target::Io => {
                let args = self
                    .args
                    .iter()
                    .map(|arg| arg.rust_wire_type(target))
                    .join(", ");
                let ret = if let Some(ret) = &self.ret {
                    format!("-> {}", ret.rust_wire_type(target))
                } else {
                    "".into()
                };
                format!("extern \"C\" fn({}){}", args, ret)
            }
            Target::Wasm => "js_sys::Function".into(),
            _ => "".into(),
        }
    }

    fn rust_wire_is_pointer(&self, _target: Target) -> bool {
        false
    }
}
