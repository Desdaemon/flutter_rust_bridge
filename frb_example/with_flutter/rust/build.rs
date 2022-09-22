use lib_flutter_rust_bridge_codegen::*;

const RUST_INPUT: &str = "src/api.rs";

fn main() {
    println!("cargo:rerun-if-changed={}", RUST_INPUT);
    let configs = config_parse(RawOpts {
        rust_input: vec![RUST_INPUT.into()],
        dart_output: vec!["../lib/bridge_generated.dart".into()],
        dart_decl_output: Some("../lib/bridge_definitions.dart".into()),
        wasm: true,
        c_output: Some(vec![
            "../ios/Runner/bridge_generated.h".into(),
            "../macos/Runner/bridge_generated.h".into(),
        ]),
        dart_format_line_length: 120,
        ..Default::default()
    });
    if let Ok(symbols) = get_symbols_if_no_duplicates(&configs) {
        for config in &configs {
            frb_codegen(config, &symbols).unwrap();
        }
    }
}
