use crate::codegen::generator::misc::target::{Target, TargetOrCommon};
use crate::codegen::generator::wire::rust::spec_generator::codec::pde::entrypoint::FfiDispatcherMode;
use crate::codegen::generator::wire::rust::spec_generator::codec::sse::entrypoint::{
    create_port_param, generate_platform_generalized_uint8list_params,
};
use crate::codegen::generator::wire::rust::spec_generator::extern_func::{
    ExternFunc, ExternFuncParam,
};
use crate::library::commands::format_rust::format_rust;
use crate::library::misc::consts::HANDLER_NAME;
use itertools::Itertools;
use log::info;
use std::fs;
use std::path::Path;
use strum::IntoEnumIterator;

pub(crate) fn generate_frb_rust_source_code(repo_base_dir: &Path) -> anyhow::Result<()> {
    info!("generate_frb_rust_source_code");

    let path_target = repo_base_dir
        .join("frb_rust")
        .join("src")
        .join("internal_generated")
        .join("mod.rs");

    let body = Target::iter()
        .map(|target| generate_target(target))
        .join("");

    let text = format!(
        "// THIS FILE IS AUTO-GENERATED BY flutter_rust_bridge_codegen internal-generate, PLEASE DO NOT EDIT

        {body}"
    );

    fs::write(&path_target, text)?;
    format_rust(&[path_target])?;

    Ok(())
}

fn generate_target(target: Target) -> String {
    let target_lowercase = target.to_string().to_lowercase();

    let funcs = [
        FfiDispatcherMode::iter()
            .map(|mode| generate_target_pde_dispatcher_mode(target, mode))
            .collect_vec(),
        vec![generate_dart_fn_deliver_output(target)],
    ]
    .concat();
    let body = funcs.iter().map(|f| f.generate("")).join("\n");

    format!(
        r#"
            #[doc(hidden)]
            #[macro_export]
            macro_rules! frb_generated_{target_lowercase}_extern_func {{
                () => {{
                    {body}
                }};
            }}
        "#
    )
}

fn generate_target_pde_dispatcher_mode(target: Target, mode: FfiDispatcherMode) -> ExternFunc {
    let partial_func_name = format!("pde_ffi_dispatcher_{}", mode.to_string().to_lowercase());

    let mut params = vec![ExternFuncParam {
        name: "func_id".to_string(),
        rust_type: "i32".to_string(),
        dart_type: "NOT_USED".to_string(),
    }];
    if mode == FfiDispatcherMode::Primary {
        params.push(create_port_param(target.into(), "$crate"));
    }
    params.extend(generate_platform_generalized_uint8list_params(
        target.into(),
        "$crate",
    ));

    let body = format!(
        "{partial_func_name}_impl({})",
        params.iter().map(|p| p.name.clone()).join(", ")
    );

    let return_type = match mode {
        FfiDispatcherMode::Primary => None,
        FfiDispatcherMode::Sync => Some("$crate::for_generated::WireSyncRust2DartSse".to_owned()),
    };

    ExternFunc {
        partial_func_name: format!("frb_{partial_func_name}"),
        params,
        return_type,
        body,
        target,
    }
}

fn generate_dart_fn_deliver_output(target: Target) -> ExternFunc {
    let params = {
        let mut ans = vec![ExternFuncParam {
            name: "call_id".to_owned(),
            rust_type: "i32".to_owned(),
            dart_type: "int".to_owned(),
        }];
        ans.extend(generate_platform_generalized_uint8list_params(
            target.into(),
            "$crate",
        ));
        ans
    };

    ExternFunc {
        partial_func_name: "dart_fn_deliver_output".into(),
        params,
        return_type: None,
        body: format!(
            "let message = unsafe {{ $crate::for_generated::Dart2RustMessageSse::from_wire(ptr_, rust_vec_len_, data_len_) }};
            {HANDLER_NAME}.dart_fn_handle_output(call_id, message)"
        ),
        target,
    }
}
