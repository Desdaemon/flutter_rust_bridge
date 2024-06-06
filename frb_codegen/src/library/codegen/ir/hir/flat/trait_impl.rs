use crate::codegen::ir::hir::flat::component::HirFlatComponent;
use crate::codegen::ir::hir::flat::function::HirFlatFunction;
use crate::codegen::ir::hir::misc::serializers::serialize_syn;

#[derive(Clone, serde::Serialize, Debug)]
pub struct HirFlatTraitImpl {
    pub(crate) trait_name: String,
    #[serde(serialize_with = "serialize_syn")]
    pub(crate) impl_ty: syn::Type,
}

impl HirFlatComponent for HirFlatTraitImpl {}
