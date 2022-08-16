/// On WASM, [JsValue][wasm_bindgen::JsValue]s cannot be shared between scopes but instead can be
/// ["transferred"]. Rust however is not aware of transferables and therefore cannot
/// capture these values. This macro wraps a closure and returns a [TransferClosure] on WASM platforms
/// which will capture these special values, or a normal [FnOnce] on other platforms.
/// Note that the parameter names must match available variables/bindings from the outer scope.
///
/// ["transferred"]: https://developer.mozilla.org/en-US/docs/Glossary/Transferable_objects
#[macro_export]
macro_rules! transfer {
    (|$($param:ident: $ty:ty),*| { $($body:tt)* }) => {{
        #[cfg(not(target_family = "wasm"))]
        {
            move || { $($body)* }
        }

        #[cfg(target_family = "wasm")]
        {
            use wasm_bindgen::JsValue;
            use $crate::ffi::FromDart;
            #[allow(unused_assignments)]
            let worker = move |transfer: &[JsValue]| {
                let mut idx = 0;
                $(
                    let $param = <$ty>::from_dart(&transfer[idx]);
                    idx += 1;
                )*
                { $($body)* }
            };
            $crate::ffi::TransferClosure::new(vec![$(<$ty>::into($param)),*], worker)
        }
    }};
}

// macro_rules! console_log {
//     ($lit:literal) => {
//         #[allow(unused_unsafe)]
//         unsafe { $crate::ffi::log($lit) }
//     };
//     ($( $tt:tt )*) => {
//         #[allow(unused_unsafe)]
//         unsafe { $crate::ffi::log(&format!($( $tt )*)) }
//     };
// }

// macro_rules! console_error {
//     ($lit:literal) => {
//         #[allow(unused_unsafe)]
//         unsafe { $crate::ffi::error($lit) }
//     };
//     ($( $tt:tt )*) => {
//         #[allow(unused_unsafe)]
//         unsafe { $crate::ffi::error(&format!($( $tt )*)) }
//     };
// }