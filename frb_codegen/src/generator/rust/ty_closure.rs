use crate::{ir::IrTypeClosure, target::Acc, type_rust_generator_struct};

use super::TypeRustGeneratorTrait;

type_rust_generator_struct!(TypeClosureGenerator, IrTypeClosure);

impl TypeRustGeneratorTrait for TypeClosureGenerator<'_> {
    fn wire2api_body(&self) -> Acc<Option<String>> {
        Acc {
            io: Some("Box::new(self)".into()),
            wasm: Some("todo!()".into()),
            ..Default::default()
        }
    }
}
