pub use allo_isolate::ZeroCopyBuffer;

pub use flutter_rust_bridge_macros::frb;
pub use handler::{FfiCallMode, Handler, WrapInfo};
#[cfg(target_arch = "wasm32")]
pub use js_sys::*;
pub use rust2dart::StreamSink;
#[cfg(target_arch = "wasm32")]
pub use wasm_bindgen;
#[cfg(target_arch = "wasm32")]
pub use wasm_bindgen::prelude::*;
#[cfg(target_arch = "wasm32")]
pub use wasm_bindgen::JsCast;

mod ffi;
pub mod handler;
pub mod rust2dart;
pub mod support;

/// Use this struct in return type of your function, in order to tell the code generator
/// the function should return synchronously. Otherwise, it is by default asynchronously.
pub struct SyncReturn<T>(pub T);
