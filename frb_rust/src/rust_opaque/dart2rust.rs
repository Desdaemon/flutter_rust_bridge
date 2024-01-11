use super::RustOpaque;
use crate::rust_opaque::codec::BaseRustOpaqueCodec;
use std::sync::Arc;

/// # Safety
///
/// This function should never be called manually.
/// Retrieving an opaque pointer from Dart is an implementation detail, so this
/// function is not guaranteed to be API-stable.
#[cfg(not(wasm))]
pub unsafe fn cst_decode_rust_opaque<T, C: BaseRustOpaqueCodec>(
    ptr: *const core::ffi::c_void,
) -> RustOpaque<T, C> {
    decode_rust_opaque_inner(ptr as _)
}

/// # Safety
///
/// This should never be called manually.
#[cfg(wasm)]
pub unsafe fn cst_decode_rust_opaque<T, C: BaseRustOpaqueCodec>(
    raw: wasm_bindgen::JsValue,
) -> RustOpaque<T, C> {
    #[cfg(target_pointer_width = "64")]
    {
        compile_error!("64-bit pointers are not supported.");
    }

    decode_rust_opaque_inner((raw.as_f64().unwrap() as usize) as _)
}

/// # Safety
///
/// This should never be called manually.
pub unsafe fn sse_decode_rust_opaque<T, C: BaseRustOpaqueCodec>(ptr: usize) -> RustOpaque<T, C> {
    decode_rust_opaque_inner(ptr as _)
}

/// # Safety
///
/// This should never be called manually.
unsafe fn decode_rust_opaque_inner<T, C: BaseRustOpaqueCodec>(ptr: *const T) -> RustOpaque<T, C> {
    assert!(!ptr.is_null());
    RustOpaque {
        arc: C::Arc::from_raw(ptr),
    }
}
