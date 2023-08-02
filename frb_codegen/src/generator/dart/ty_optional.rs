use crate::generator::dart::ty::*;
use crate::ir::*;
use crate::target::{Acc, Target};
use crate::type_dart_generator_struct;

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
        self.ir.inner.needs_indirection(Target::Io).then(|| {
            if self.ir.inner.is_primitive() {
                format!(
                    "if (apiObj != null) wireObj.value = api2wire_{}(apiObj);",
                    self.ir.inner.safe_ident()
                )
            } else {
                format!(
                    "if (apiObj != null) _api_fill_to_wire_{}(apiObj, wireObj.ref);",
                    self.ir.inner.safe_ident()
                )
            }
        })
    }

    fn wire2api_body(&self) -> String {
        format!(
            "return raw == null ? null : _wire2api_{}(raw);",
            self.ir.inner.safe_ident()
        )
    }
}
