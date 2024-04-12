use crate::codegen::ir::comment::IrComment;
use crate::codegen::ir::default::IrDefaultValue;
use crate::codegen::ir::ident::IrIdent;
use crate::codegen::ir::ty::IrType;
use serde::Deserialize;

crate::ir! {
pub struct IrField {
    pub ty: IrType,
    pub name: IrIdent,
    pub is_final: bool,
    pub comments: Vec<IrComment>,
    pub default: Option<IrDefaultValue>,
    pub ownership_mode: OwnershipMode,
    pub settings: IrFieldSettings,
}

#[derive(Deserialize, Default)]
pub struct IrFieldSettings {
    pub is_in_mirrored_enum: bool,
}
}

#[derive(Debug, Clone, Hash, Eq, PartialEq, serde::Serialize, strum_macros::Display)]
pub enum OwnershipMode {
    /// "T"
    Owned,
    /// "&T"
    Ref,
    /// "&mut T"
    RefMut,
}

impl IrField {
    #[inline]
    pub fn is_optional(&self) -> bool {
        matches!(&self.ty, IrType::Optional(_)) || self.default.is_some()
    }
}
