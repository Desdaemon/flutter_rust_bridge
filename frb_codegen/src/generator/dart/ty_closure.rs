use crate::{ir::IrTypeClosure, target::Acc, type_dart_generator_struct};

use super::TypeDartGeneratorTrait;

type_dart_generator_struct!(TypeClosureGenerator, IrTypeClosure);

impl TypeDartGeneratorTrait for TypeClosureGenerator<'_> {
    fn api2wire_body(&self) -> Acc<Option<String>> {
        todo!()
    }
}
