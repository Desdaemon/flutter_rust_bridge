use crate::generator::rust::generate_import;
use crate::generator::rust::ty::*;
use crate::ir::*;
use crate::target::Acc;
use crate::target::Target;
use crate::type_rust_generator_struct;

type_rust_generator_struct!(TypeOptionalGenerator, IrTypeOptional);

impl TypeRustGeneratorTrait for TypeOptionalGenerator<'_> {
    fn wire2api_body(&self) -> Acc<Option<String>> {
        Acc {
            wasm: if self.ir.inner.is_js_value() || self.ir.inner.needs_box(Target::Wasm) {
                Some("(!self.is_undefined() && !self.is_null()).then(|| self.wire2api())".into())
            } else {
                Some("self.map(Wire2Api::wire2api)".into())
            },
            ..Default::default()
        }
    }

    fn wire2api_jsvalue(&self) -> Option<std::borrow::Cow<str>> {
        let target = !self.ir.inner.is_js_value() && !self.ir.inner.needs_box(Target::Wasm);
        target.then(|| "(!self.is_undefined() && !self.is_null()).then(|| self.wire2api())".into())
    }

    fn convert_to_dart(&self, obj: String) -> String {
        if let Some(wrapper) = self.ir.inner.wrapper_struct(self.context.ir_file) {
            format!("{obj}.map({wrapper}).into_dart()")
        } else {
            format!("{obj}.into_dart()")
        }
    }

    fn imports(&self) -> Option<String> {
        generate_import(&self.ir.inner, self.context.ir_file, self.context.config)
    }
}
