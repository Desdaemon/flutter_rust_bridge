use crate::target::Acc;
use crate::{ir::IrTypeClosure, type_dart_generator_struct};

use super::TypeDartGeneratorTrait;

type_dart_generator_struct!(TypeClosureGenerator, IrTypeClosure);

impl TypeDartGeneratorTrait for TypeClosureGenerator<'_> {
    fn api2wire_body(&self) -> Acc<Option<String>> {
        Acc {
            io: Some("return ffi.Pointer.fromFunction(raw);".into()),
            ..Default::default()
        }
    }

    fn api_fill_to_wire_body(&self) -> Option<String> {
        None
    }

    fn structs(&self) -> String {
        "".to_string()
    }

    fn wire2api_body(&self) -> String {
        "".to_string()
    }
}
