use crate::{ir::IrTypeClosure, type_rust_generator_struct};

use super::TypeRustGeneratorTrait;

type_rust_generator_struct!(TypeClosureGenerator, IrTypeClosure);

impl TypeRustGeneratorTrait for TypeClosureGenerator<'_> {
    fn wire2api_body(&self) -> crate::target::Acc<Option<String>> {
        todo!()
    }
}
