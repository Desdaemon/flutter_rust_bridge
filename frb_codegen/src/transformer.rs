use log::debug;

use crate::api_types::ApiType::{Boxed, StructRef};
use crate::api_types::{ApiField, ApiFile, ApiFunc, ApiTypeBoxed};

pub fn transform(src: ApiFile) -> ApiFile {
    let dst_funcs = src
        .funcs
        .into_iter()
        .map(|src_func| ApiFunc {
            inputs: src_func
                .inputs
                .into_iter()
                .map(transform_func_input_add_boxed)
                .collect(),
            ..src_func
        })
        .collect();

    ApiFile {
        funcs: dst_funcs,
        ..src
    }
}

fn transform_func_input_add_boxed(input: ApiField) -> ApiField {
    if let StructRef(_) = &input.ty {
        debug!(
            "transform_func_input_add_boxed wrap Boxed to field={:?}",
            input
        );
        ApiField {
            ty: Boxed(Box::new(ApiTypeBoxed {
                exist_in_real_api: false, // <--
                inner: input.ty.clone(),
            })),
            ..input
        }
    } else {
        input.clone()
    }
}
