use crate::codegen::generator::codec::structs::CodecModePack;
use crate::codegen::ir::comment::IrComment;
use crate::codegen::ir::field::IrField;
use crate::codegen::ir::namespace::NamespacedName;
use crate::codegen::ir::ty::primitive::IrTypePrimitive;
use crate::codegen::ir::ty::{IrContext, IrType};

crate::ir! {
pub struct IrFunc {
    pub name: NamespacedName,
    pub id: i32,
    pub inputs: Vec<IrField>,
    pub output: IrType,
    pub error_output: Option<IrType>,
    pub owner: IrFuncOwnerInfo,
    pub mode: IrFuncMode,
    pub rust_async: bool,
    pub initializer: bool,
    // When later we support setter, etc, we should refactor it into an enum
    pub getter: bool,
    pub comments: Vec<IrComment>,
    pub codec_mode_pack: CodecModePack,
    // Currently, we use serde only for tests. Since lineno can be unstable, we skip this field for comparison
    #[serde(skip_serializing)]
    pub src_lineno: usize,
}

#[derive(Copy)]
pub enum IrFuncMode {
    Normal,
    Sync,
    Stream {
        // The index of StreamSink in the function arguments
        argument_index: usize,
    },
}

pub enum IrFuncOwnerInfo {
    Function,
    Method(IrFuncOwnerInfoMethod),
}

pub struct IrFuncOwnerInfoMethod {
    pub(crate) enum_or_struct_name: NamespacedName,
    pub(crate) actual_method_name: String,
    pub(crate) mode: IrFuncOwnerInfoMethodMode,
}

pub enum IrFuncOwnerInfoMethodMode {
    Static,
    Instance { owned: bool },
}
}

pub(crate) struct TypeNode<'a> {
    pub ty: &'a IrType,
    /// Is this type accepted from or returned to Dart?
    pub output: bool,
}

impl IrFunc {
    pub(crate) fn fallible(&self) -> bool {
        self.error_output.is_some()
    }

    pub(crate) fn visit_types<F: FnMut(TypeNode) -> bool>(
        &self,
        f: &mut F,
        include_inputs: bool,
        include_output: bool,
        ir_context: &impl IrContext,
    ) {
        if include_inputs {
            for field in &self.inputs {
                field
                    .ty
                    .visit_types(&mut |ty| f(TypeNode { ty, output: false }), ir_context);
            }
        }
        if include_output {
            self.output
                .visit_types(&mut |ty| f(TypeNode { ty, output: true }), ir_context);

            let error_output = (self.error_output.as_ref().cloned())
                .unwrap_or(IrType::Primitive(IrTypePrimitive::Unit));
            error_output.visit_types(&mut |ty| f(TypeNode { ty, output: true }), ir_context);
        }
    }
}
