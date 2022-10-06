use crate::{ir::IrTypeClosure, target::Acc, type_dart_generator_struct};

use super::TypeDartGeneratorTrait;

type_dart_generator_struct!(TypeClosureGenerator, IrTypeClosure);

impl TypeDartGeneratorTrait for TypeClosureGenerator<'_> {
    fn api2wire_body(&self) -> Acc<Option<String>> {
        Acc {
            io: Some("return ffi.Pointer.fromFunction(raw);".into()),
            wasm: Some("throw UnimplementedError();".into()),
            ..Default::default()
        }
    }
}
