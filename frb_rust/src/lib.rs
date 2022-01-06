pub use allo_isolate::ZeroCopyBuffer;

pub use flutter_rust_bridge_macros::frb;
pub use handler::{FfiCallMode, Handler, WrapInfo};
pub use opaque::Opaque;
pub use rust2dart::StreamSink;

pub mod handler;
pub mod opaque;
pub mod rust2dart;
pub mod support;

pub(crate) static LOCK: parking_lot::Mutex<()> = parking_lot::const_mutex(());

/// Use this struct in return type of your function, in order to tell the code generator
/// the function should return synchronously. Otherwise, it is by default asynchronously.
pub struct SyncReturn<T>(pub T);
