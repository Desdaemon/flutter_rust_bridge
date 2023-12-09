use crate::codegen::generator::codec::sse::ty::*;

impl<'a> CodecSseTyTrait for PrimitiveCodecSseTy<'a> {
    fn generate_encode(&self, lang: &Lang) -> Option<String> {
        let cast = if matches!(self.ir, IrTypePrimitive::Bool) {
            " ? 1 : 0"
        } else {
            ""
        };

        Some(match self.ir {
            IrTypePrimitive::Unit => "".into(),
            _ => match lang {
                Lang::DartLang(_) => format!(
                    "serializer.buffer.put{}(self{cast});",
                    get_serializer_dart_postfix(&self.ir)
                ),
                Lang::RustLang(_) => format!(
                    "serializer.cursor.write_{}::<NativeEndian>(self).unwrap();",
                    self.ir.rust_api_type()
                ),
            },
        })
    }

    fn generate_decode(&self, lang: &Lang) -> Option<String> {
        let cast = if matches!(self.ir, IrTypePrimitive::Bool) {
            " != 0"
        } else {
            ""
        };

        Some(match self.ir {
            IrTypePrimitive::Unit => "".into(),
            _ => match lang {
                Lang::DartLang(_) => format!(
                    "return deserializer.buffer.get{}(){cast};",
                    get_serializer_dart_postfix(&self.ir)
                ),
                Lang::RustLang(_) => {
                    format!(
                        "deserializer.cursor.read_{}::<NativeEndian>().unwrap(){cast}",
                        self.ir.rust_api_type()
                    )
                }
            },
        })
    }
}

pub(super) fn get_serializer_dart_postfix(prim: &IrTypePrimitive) -> &'static str {
    match prim {
        IrTypePrimitive::U8 => "Uint8",
        IrTypePrimitive::I8 => "Int8",
        IrTypePrimitive::U16 => "Uint16",
        IrTypePrimitive::I16 => "Int16",
        IrTypePrimitive::U32 => "Uint32",
        IrTypePrimitive::I32 => "Int32",
        IrTypePrimitive::U64 => "Uint64",
        IrTypePrimitive::I64 => "Int64",
        IrTypePrimitive::Usize => "Uint64",
        IrTypePrimitive::Isize => "Int64",
        IrTypePrimitive::F32 => "Float32",
        IrTypePrimitive::F64 => "Float64",
        IrTypePrimitive::Bool => "Uint8",
        IrTypePrimitive::Unit => unreachable!(),
    }
}
