// NOTE: This file is mimicking how a human developer writes tests,
// and is auto-generated from `rust_opaque_sync.rs` by frb_internal
// Please do not modify manually, but modify the origin and re-run frb_internal generator

// FRB_INTERNAL_GENERATOR: {"forbiddenDuplicatorModes": ["sync", "rustAsync", "sync sse", "rustAsync sse", "sync moi", "rustAsync moi", "sync sse moi", "rustAsync sse moi"], "enableAll": true}

use super::rust_opaque_twin_sse_moi::NonCloneDataTwinSseMoi;
pub use crate::auxiliary::sample_types::{HideDataRaw, NonCloneDataRaw};
use anyhow::Result;
#[allow(unused_imports)]
use flutter_rust_bridge::{frb, RustOpaque};

pub struct HideDataAnotherTwinSseMoi(HideDataRaw);

/// Structure for testing the SyncReturn<RustOpaque> code generator.
/// FrbOpaqueSyncReturn must be only return type.
/// FrbOpaqueSyncReturn must should be without wrapper like Option<> Vec<> etc.
pub struct FrbOpaqueSyncReturnTwinSseMoi;

#[frb(sync)]
#[flutter_rust_bridge::frb(rust_opaque_codec_moi)]
#[flutter_rust_bridge::frb(serialize)]
pub fn sync_option_rust_opaque_twin_sse_moi(
) -> Result<Option<crate::frb_generated::RustOpaqueMoi<HideDataAnotherTwinSseMoi>>> {
    Ok(Some(crate::frb_generated::RustOpaqueMoi::new(
        HideDataAnotherTwinSseMoi(HideDataRaw::new()),
    )))
}

#[frb(sync)]
#[flutter_rust_bridge::frb(rust_opaque_codec_moi)]
#[flutter_rust_bridge::frb(serialize)]
pub fn sync_create_opaque_twin_sse_moi(
) -> crate::frb_generated::RustOpaqueMoi<HideDataAnotherTwinSseMoi> {
    crate::frb_generated::RustOpaqueMoi::new(HideDataAnotherTwinSseMoi(HideDataRaw::new()))
}

#[frb(sync)]
#[flutter_rust_bridge::frb(rust_opaque_codec_moi)]
#[flutter_rust_bridge::frb(serialize)]
pub fn sync_create_non_clone_twin_sse_moi(
) -> crate::frb_generated::RustOpaqueMoi<NonCloneDataTwinSseMoi> {
    crate::frb_generated::RustOpaqueMoi::new(NonCloneDataTwinSseMoi(NonCloneDataRaw::new()))
}

// OpaqueSyncStruct does not implement Send trait.
//
// #[flutter_rust_bridge::frb(rust_opaque_codec_moi)] #[flutter_rust_bridge::frb(serialize)] pub fn run_opaque_twin_sse_moi(opaque: Opaque<OpaqueSyncStruct>) -> String {
//     data.0.hide_data()
// }

/// Structure for testing the sync-mode RustOpaque code generator.
/// FrbOpaqueSyncReturn must be only return type.
/// FrbOpaqueSyncReturn must be without wrapper like Option<> Vec<> etc.
#[frb(sync)]
#[flutter_rust_bridge::frb(rust_opaque_codec_moi)]
#[flutter_rust_bridge::frb(serialize)]
pub fn frb_sync_generator_test_twin_sse_moi(
) -> crate::frb_generated::RustOpaqueMoi<FrbOpaqueSyncReturnTwinSseMoi> {
    crate::frb_generated::RustOpaqueMoi::new(FrbOpaqueSyncReturnTwinSseMoi)
}
