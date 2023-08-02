use crate::generator::dart::ty::*;
use crate::target::{Acc, Target};
use crate::type_dart_generator_struct;
use crate::{fmt, ir::*};

type_dart_generator_struct!(TypeOptionalGenerator, IrTypeOptional);

impl TypeDartGeneratorTrait for TypeOptionalGenerator<'_> {
    fn api2wire_body(&self) -> Acc<Option<String>> {
        let inner = self.ir.inner.safe_ident();
        Acc {
            wasm: Some(format!(
                "return raw == null ? null : api2wire_{}(raw);",
                inner
            )),
            io: Some(format!(
                "return raw == null ? ffi.nullptr : api2wire_{}(raw);",
                if self.ir.inner.needs_indirection(Target::Io) {
                    format!("box_autoadd_{}", &inner)
                } else {
                    inner
                }
            )),
            ..Default::default()
        }
    }

    fn api_fill_to_wire_body(&self) -> Option<String> {
        let inner = self.ir.inner.safe_ident();
        if self.ir.inner.needs_indirection(Target::Io) {
            return Some(if self.ir.inner.is_primitive() {
                format!("if (apiObj != null) wireObj.value = api2wire_{inner}(apiObj);")
            } else {
                format!("if (apiObj != null) _api_fill_to_wire_{inner}(apiObj, wireObj.ref);")
            });
        }

        let body = match self.ir.inner.as_ref() {
            // IrType::Delegate(delegate) => fmt!(
            //     "final delegate = api2wire_{}(apiObj);"
            //     "_api_fill_to_wire_{}(delegate, wireObj);",
            //     delegate.safe_ident(),
            //     delegate.get_delegate().safe_ident()
            // )
            // .to_string(),
            IrType::Delegate(delegate) => format!("throw UnimplementedError(r'{:?}');", delegate),
            IrType::Boxed(boxed) => format!("throw UnimplementedError(r'{:?}');", boxed),
            IrType::PrimitiveList(prims) => format!("throw UnimplementedError(r'{:?}');", prims),
            _ => return None,
        };

        Some(format!("if (apiObj == null) return; {body}"))
    }

    fn wire2api_body(&self) -> String {
        format!(
            "return raw == null ? null : _wire2api_{}(raw);",
            self.ir.inner.safe_ident()
        )
    }
}
