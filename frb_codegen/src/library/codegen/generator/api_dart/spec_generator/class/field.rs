use crate::codegen::ir::field::IrField;
use crate::codegen::ir::ty::delegate::IrTypeDelegate;
use crate::codegen::ir::ty::IrType;
use crate::{codegen::ir::default::IrDefaultValue, utils::dart_keywords::escape_dart_keywords};
use convert_case::{Case, Casing};
use std::borrow::Cow;

pub(crate) fn generate_field_required_modifier(field: &IrField) -> &str {
    if field.is_optional() {
        ""
    } else {
        "required "
    }
}

// the function signature is not covered while the whole body is covered - looks like a bug in coverage tool
// frb-coverage:ignore-start
pub(crate) fn generate_field_default(
    field: &IrField,
    freezed: bool,
    dart_enums_style: bool,
) -> String {
    // frb-coverage:ignore-end
    if let Some(default_value) = field.default.as_ref() {
        let default_value = match default_value {
            IrDefaultValue::String { content }
                if !matches!(&field.ty, IrType::Delegate(IrTypeDelegate::String)) =>
            {
                default_value_maybe_to_dart_style(content, dart_enums_style)
            }
            _ => default_value.to_dart_literal(),
        };

        if freezed {
            format!("@Default({default_value})")
        } else {
            format!("= {default_value}")
        }
    } else {
        "".to_string()
    }
}

fn default_value_maybe_to_dart_style(value: &str, enable: bool) -> Cow<str> {
    if enable {
        default_value_to_dart_style(value).into()
    } else {
        value.into()
    }
}

fn default_value_to_dart_style(value: &str) -> String {
    if let Some((enum_name, variant_name)) = value.split_once('.') {
        let variant_name = variant_name.to_case(Case::Camel);
        let variant_name = escape_dart_keywords(&variant_name);
        format!("{enum_name}.{variant_name}")
    } else {
        // Probably invalid code, so just preserve it.
        value.to_string()
    }
}
