use crate::codegen::generator::acc::Acc;
use crate::codegen::generator::misc::target::TargetOrCommon;
use crate::codegen::generator::wire::misc::has_port_argument;
use crate::codegen::generator::wire::rust::spec_generator::base::WireRustGeneratorContext;
use crate::codegen::generator::wire::rust::spec_generator::codec::base::WireRustCodecEntrypoint;
use crate::codegen::generator::wire::rust::spec_generator::codec::dco::base::WireRustCodecDcoGenerator;
use crate::codegen::generator::wire::rust::spec_generator::extern_func::{
    ExternFunc, ExternFuncParam,
};
use crate::codegen::generator::wire::rust::spec_generator::output_code::WireRustOutputCode;
use crate::codegen::ir::func::IrFuncOwnerInfoMethodMode::Instance;
use crate::codegen::ir::func::{IrFunc, IrFuncMode, IrFuncOwnerInfo, IrFuncOwnerInfoMethod};
use crate::codegen::ir::pack::IrPack;
use crate::codegen::ir::ty::rust_auto_opaque::OwnershipMode;
use crate::codegen::ir::ty::IrType;
use crate::library::codegen::generator::wire::rust::spec_generator::codec::dco::encoder::ty::WireRustCodecDcoGeneratorEncoderTrait;
use crate::misc::consts::HANDLER_NAME;
use convert_case::{Case, Casing};
use itertools::Itertools;
use std::convert::TryInto;

pub(crate) fn generate_wire_func(
    func: &IrFunc,
    context: WireRustGeneratorContext,
) -> Acc<WireRustOutputCode> {
    let dart2rust_codec = WireRustCodecEntrypoint::from(func.codec_mode_pack.dart2rust);

    let ir_pack = context.ir_pack;
    let params = dart2rust_codec.generate_func_params(func, context);
    let inner_func_args = generate_inner_func_args(func, ir_pack, context);
    let wrap_info_obj = generate_wrap_info_obj(func);
    let code_decode = dart2rust_codec.generate_func_call_decode(func, context);
    let code_inner_decode = generate_code_inner_decode(func);
    let code_call_inner_func_result = generate_code_call_inner_func_result(func, inner_func_args);
    let handler_func_name = generate_handler_func_name(func, ir_pack, context);
    let return_type = generate_return_type(func);
    let code_closure = generate_code_closure(
        func,
        &code_decode,
        &code_inner_decode,
        &code_call_inner_func_result,
    );
    let func_name = wire_func_name(func);

    Acc::new(|target| match target {
        TargetOrCommon::Io | TargetOrCommon::Web => ExternFunc {
            partial_func_name: func_name.clone(),
            params: params.clone().get(target),
            return_type: return_type.clone(),
            body: generate_redirect_body(func, &params.common),
            target: target.try_into().unwrap(),
            needs_ffigen: true,
        }
        .into(),
        TargetOrCommon::Common => format!(
            "fn {func_name}_impl({params}) {return_type} {{
                {HANDLER_NAME}.{handler_func_name}({wrap_info_obj}, move || {{ {code_closure} }})
            }}",
            params = params
                .common
                .iter()
                .map(|param| param.rust_name_and_type())
                .join(","),
            return_type = return_type
                .clone()
                .map(|t| format!("-> {t}"))
                .unwrap_or_default(),
        )
        .into(),
    })
}

fn generate_inner_func_args(
    func: &IrFunc,
    ir_pack: &IrPack,
    context: WireRustGeneratorContext,
) -> Vec<String> {
    let mut ans = func
        .inputs
        .iter()
        .enumerate()
        .map(|(index, field)| {
            let mut ans = format!("api_{}", field.name.rust_style());
            if let IrType::RustAutoOpaque(o) = &field.ty {
                ans = match o.ownership_mode {
                    OwnershipMode::Ref => format!("&{ans}"),
                    OwnershipMode::RefMut => format!("&mut {ans}"),
                    _ => ans,
                };
            } else if index == 0
                && matches!(
                    &func.owner,
                    IrFuncOwnerInfo::Method(IrFuncOwnerInfoMethod {
                        mode: Instance { owned: false },
                        ..
                    })
                )
            {
                ans = format!("&{ans}");
            }
            ans
        })
        .collect_vec();

    if let IrFuncMode::Stream { argument_index } = func.mode {
        ans.insert(
            argument_index,
            format!(
                "StreamSink::new(context.rust2dart_context().stream_sink::<_,{}>())",
                WireRustCodecDcoGenerator::new(
                    func.output.clone(),
                    context.as_wire_rust_codec_dco_context()
                )
                .intodart_type(ir_pack)
            ),
        );
    }

    ans
}

fn generate_wrap_info_obj(func: &IrFunc) -> String {
    format!(
        "flutter_rust_bridge::for_generated::TaskInfo{{ debug_name: \"{name}\", port: {port}, mode: flutter_rust_bridge::for_generated::FfiCallMode::{mode} }}",
        name = func.name.name,
        port = if has_port_argument(func.mode) {
            "Some(port_)"
        } else {
            "None"
        },
        mode = ffi_call_mode(func.mode),
    )
}

fn generate_code_inner_decode(func: &IrFunc) -> String {
    func.inputs
        .iter()
        .filter_map(|field| {
            if let IrType::RustAutoOpaque(o) = &field.ty {
                if o.ownership_mode != OwnershipMode::Owned {
                    let mode = o.ownership_mode.to_string().to_case(Case::Snake);
                    let mutability = if o.ownership_mode == OwnershipMode::RefMut {
                        "mut "
                    } else {
                        ""
                    };
                    Some(format!(
                        "let {mutability}api_{name} = api_{name}.rust_auto_opaque_decode_{mode}();\n",
                        name = field.name.rust_style()
                    ))
                } else {
                    None
                }
            } else {
                None
            }
        })
        .join("")
}

fn generate_code_call_inner_func_result(func: &IrFunc, inner_func_args: Vec<String>) -> String {
    let mut ans = match &func.owner {
        IrFuncOwnerInfo::Function => {
            format!("{}({})", func.name.rust_style(), inner_func_args.join(", "))
        }
        IrFuncOwnerInfo::Method(method) => {
            format!(
                r"{}::{}({})",
                method.enum_or_struct_name.rust_style(),
                method.actual_method_name,
                inner_func_args.join(", ")
            )
        }
    };

    if func.rust_async {
        ans = format!("{ans}.await");
    }

    if !func.fallible() {
        ans = format!("Result::<_,()>::Ok({ans})");
    }

    ans
}

fn generate_handler_func_name(
    func: &IrFunc,
    _ir_pack: &IrPack,
    _context: WireRustGeneratorContext,
) -> String {
    let codec = format!(
        "flutter_rust_bridge::for_generated::{}Codec",
        func.codec_mode_pack.rust2dart.delegate_or_self()
    );

    match func.mode {
        IrFuncMode::Sync => format!("wrap_sync::<{codec},_>"),
        IrFuncMode::Normal | IrFuncMode::Stream { .. } => {
            let name = if func.rust_async {
                "wrap_async"
            } else {
                "wrap_normal"
            };

            // let output = if matches!(func.mode, IrFuncMode::Stream { .. }) {
            //     "()".to_owned()
            // } else {
            //     WireRustCodecDcoGenerator::new(
            //         func.output.clone(),
            //         context.as_wire_rust_codec_dco_context(),
            //     )
            //     .intodart_type(ir_pack)
            // };

            let generic_args = if func.rust_async {
                format!("<{codec},_,_,_>")
            } else {
                format!("<{codec},_,_>")
            };

            format!("{name}::{generic_args}")
        }
    }
}

fn generate_return_type(func: &IrFunc) -> Option<String> {
    match func.mode {
        IrFuncMode::Sync => Some(format!(
            "flutter_rust_bridge::for_generated::WireSyncRust2Dart{}",
            func.codec_mode_pack.rust2dart.delegate_or_self(),
        )),
        IrFuncMode::Normal | IrFuncMode::Stream { .. } => None,
    }
}

fn generate_code_closure(
    func: &IrFunc,
    code_decode: &str,
    code_inner_decode: &str,
    code_call_inner_func_result: &str,
) -> String {
    let codec = (func.codec_mode_pack.rust2dart.delegate_or_self())
        .to_string()
        .to_case(Case::Snake);

    match func.mode {
        IrFuncMode::Sync => {
            format!(
                "{code_decode}
                transform_result_{codec}((move || {{
                    {code_inner_decode} {code_call_inner_func_result}
                }})())"
            )
        }
        IrFuncMode::Normal | IrFuncMode::Stream { .. } => {
            let maybe_async_move = if func.rust_async { "async move" } else { "" };
            let maybe_await = if func.rust_async { ".await" } else { "" };
            format!(
                "{code_decode} move |context| {maybe_async_move} {{
                    transform_result_{codec}((move || {maybe_async_move} {{
                        {code_inner_decode} {code_call_inner_func_result}
                    }})(){maybe_await})
                }}"
            )
        }
    }
}

fn generate_redirect_body(func: &IrFunc, params: &[ExternFuncParam]) -> String {
    format!(
        "{}_impl({})",
        wire_func_name(func),
        params.iter().map(|x| x.name.clone()).join(", "),
    )
}

pub(crate) fn wire_func_name(func: &IrFunc) -> String {
    format!("wire_{}", func.name.name)
}

fn ffi_call_mode(mode: IrFuncMode) -> &'static str {
    match mode {
        IrFuncMode::Normal => "Normal",
        IrFuncMode::Sync => "Sync",
        IrFuncMode::Stream { .. } => "Stream",
    }
}
