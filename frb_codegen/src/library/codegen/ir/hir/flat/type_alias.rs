use crate::codegen::ir::hir::misc::serializers::serialize_syn;
use serde::Serialize;
use syn::Type;
use crate::codegen::ir::hir::flat::component::HirFlatComponent;
use crate::codegen::ir::hir::flat::trait_impl::HirFlatTraitImpl;

#[derive(Clone, Debug, Serialize)]
pub struct HirFlatTypeAlias {
    pub(crate) ident: String,
    #[serde(serialize_with = "serialize_syn")]
    pub(crate) target: Type,
}

impl HirFlatComponent for HirFlatTypeAlias {}
