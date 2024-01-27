use crate::codegen::generator::api_dart::spec_generator::base::{
    ApiDartGenerator, ApiDartGeneratorContext,
};
use crate::codegen::ir::annotation::IrDartAnnotation;
use crate::codegen::ir::comment::IrComment;
use crate::codegen::ir::func::{IrFunc, IrFuncMode};
use crate::codegen::ir::import::IrDartImport;
use crate::codegen::ir::namespace::Namespace;
use crate::codegen::ir::pack::DistinctTypeGatherer;
use crate::codegen::ir::ty::IrType;
use crate::library::codegen::generator::api_dart::spec_generator::info::ApiDartGeneratorInfoTrait;
use crate::library::codegen::ir::ty::IrTypeTrait;
use crate::utils::path_utils::path_to_string;
use anyhow::Context;
use itertools::Itertools;
use pathdiff::diff_paths;

/// A trailing newline is included if comments is not empty.
pub(crate) fn generate_dart_comments(comments: &[IrComment]) -> String {
    let mut comments = comments
        .iter()
        .map(|comment| comment.0.clone())
        .collect_vec()
        .join("\n");
    if !comments.is_empty() {
        comments.push('\n');
    }
    comments
}

pub(crate) fn generate_dart_metadata(metadata: &[IrDartAnnotation]) -> String {
    let mut metadata = metadata
        .iter()
        .map(|it| match &it.library {
            Some(IrDartImport {
                alias: Some(alias), ..
            }) => format!("@{}.{}", alias, it.content),
            _ => format!("@{}", it.content),
        })
        .collect_vec()
        .join("\n");
    if !metadata.is_empty() {
        metadata.push('\n');
    }
    metadata
}

pub(crate) fn generate_dart_maybe_implements_exception(is_exception: bool) -> &'static str {
    if is_exception {
        "implements FrbException"
    } else {
        ""
    }
}

pub(crate) fn generate_function_dart_return_type(func_mode: &IrFuncMode, inner: &str) -> String {
    match func_mode {
        IrFuncMode::Normal => format!("Future<{inner}>"),
        IrFuncMode::Sync => inner.to_string(),
        IrFuncMode::Stream { .. } => format!("Stream<{inner}>"),
    }
}

pub(crate) fn generate_imports_which_types_and_funcs_use(
    current_file_namespace: &Namespace,
    seed_types: Option<&[&IrType]>,
    seed_funcs: Option<&[&IrFunc]>,
    context: ApiDartGeneratorContext,
) -> anyhow::Result<String> {
    let interest_types = {
        let mut gatherer = DistinctTypeGatherer::new();
        if let Some(types) = seed_types {
            (types.iter()).for_each(|x| x.visit_types(&mut |ty| gatherer.add(ty), context.ir_pack));
        }
        if let Some(funcs) = seed_funcs {
            (funcs.iter()).for_each(|x| {
                x.visit_types(
                    &mut |node| gatherer.add(node.ty),
                    true,
                    true,
                    context.ir_pack,
                )
            });
        }
        gatherer.gather()
    };

    let import = interest_types
        .iter()
        .map(|ty| generate_imports_from_ty(ty, current_file_namespace, context))
        .collect::<anyhow::Result<Vec<_>>>()?
        .iter()
        .join("");

    Ok(import)
}

fn generate_imports_from_ty(
    ty: &IrType,
    current_file_namespace: &Namespace,
    context: ApiDartGeneratorContext,
) -> anyhow::Result<String> {
    let import_ty_itself = if let Some(ty_namespace) = ty.self_namespace() {
        if &ty_namespace != current_file_namespace {
            let path_diff = diff_paths(
                ty_namespace.to_pseudo_io_path("dart"),
                (current_file_namespace.to_pseudo_io_path("dart").parent()).unwrap(),
            )
            .context("cannot diff path")?;
            format!(
                "import '{}';\n",
                path_to_string(&path_diff).unwrap().replace('\\', "/")
            )
        } else {
            "".to_owned()
        }
    } else {
        "".to_owned()
    };

    let import_extra = ApiDartGenerator::new(ty.clone(), context)
        .dart_import()
        .unwrap_or_default();

    Ok(import_ty_itself + &import_extra)
}
