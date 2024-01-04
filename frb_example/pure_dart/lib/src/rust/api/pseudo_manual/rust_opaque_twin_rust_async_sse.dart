// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'rust_opaque_sync_twin_sse.dart';
import 'rust_opaque_twin_rust_async.dart';
part 'rust_opaque_twin_rust_async_sse.freezed.dart';

Future<HideData> createOpaqueTwinRustAsyncSse({dynamic hint}) =>
    RustLib.instance.api.createOpaqueTwinRustAsyncSse(hint: hint);

Future<HideData?> createOptionOpaqueTwinRustAsyncSse(
        {HideData? opaque, dynamic hint}) =>
    RustLib.instance.api
        .createOptionOpaqueTwinRustAsyncSse(opaque: opaque, hint: hint);

Future<EnumOpaqueTwinRustAsyncSseArray5> createArrayOpaqueEnumTwinRustAsyncSse(
        {dynamic hint}) =>
    RustLib.instance.api.createArrayOpaqueEnumTwinRustAsyncSse(hint: hint);

Future<String> runEnumOpaqueTwinRustAsyncSse(
        {required EnumOpaqueTwinRustAsyncSse opaque, dynamic hint}) =>
    RustLib.instance.api
        .runEnumOpaqueTwinRustAsyncSse(opaque: opaque, hint: hint);

Future<String> runOpaqueTwinRustAsyncSse(
        {required HideData opaque, dynamic hint}) =>
    RustLib.instance.api.runOpaqueTwinRustAsyncSse(opaque: opaque, hint: hint);

Future<String> runOpaqueWithDelayTwinRustAsyncSse(
        {required HideData opaque, dynamic hint}) =>
    RustLib.instance.api
        .runOpaqueWithDelayTwinRustAsyncSse(opaque: opaque, hint: hint);

Future<HideDataArray2> opaqueArrayTwinRustAsyncSse({dynamic hint}) =>
    RustLib.instance.api.opaqueArrayTwinRustAsyncSse(hint: hint);

Future<String> runNonCloneTwinRustAsyncSse(
        {required NonCloneData clone, dynamic hint}) =>
    RustLib.instance.api.runNonCloneTwinRustAsyncSse(clone: clone, hint: hint);

Future<NonSendHideData> createSyncOpaqueTwinRustAsyncSse({dynamic hint}) =>
    RustLib.instance.api.createSyncOpaqueTwinRustAsyncSse(hint: hint);

Future<void> opaqueArrayRunTwinRustAsyncSse(
        {required HideDataArray2 data, dynamic hint}) =>
    RustLib.instance.api.opaqueArrayRunTwinRustAsyncSse(data: data, hint: hint);

Future<List<HideData>> opaqueVecTwinRustAsyncSse({dynamic hint}) =>
    RustLib.instance.api.opaqueVecTwinRustAsyncSse(hint: hint);

Future<void> opaqueVecRunTwinRustAsyncSse(
        {required List<HideData> data, dynamic hint}) =>
    RustLib.instance.api.opaqueVecRunTwinRustAsyncSse(data: data, hint: hint);

Future<OpaqueNestedTwinRustAsyncSse> createNestedOpaqueTwinRustAsyncSse(
        {dynamic hint}) =>
    RustLib.instance.api.createNestedOpaqueTwinRustAsyncSse(hint: hint);

Future<void> runNestedOpaqueTwinRustAsyncSse(
        {required OpaqueNestedTwinRustAsyncSse opaque, dynamic hint}) =>
    RustLib.instance.api
        .runNestedOpaqueTwinRustAsyncSse(opaque: opaque, hint: hint);

Future<String> unwrapRustOpaqueTwinRustAsyncSse(
        {required HideData opaque, dynamic hint}) =>
    RustLib.instance.api
        .unwrapRustOpaqueTwinRustAsyncSse(opaque: opaque, hint: hint);

/// Function to check the code generator.
/// FrbOpaqueReturn must be only return type.
/// FrbOpaqueReturn must not be used as an argument.
Future<FrbOpaqueReturn> frbGeneratorTestTwinRustAsyncSse({dynamic hint}) =>
    RustLib.instance.api.frbGeneratorTestTwinRustAsyncSse(hint: hint);

// Rust type: flutter_rust_bridge::RustOpaque<Box<dyn DartDebugTwinRustAsyncSse>>
@sealed
class BoxDartDebugTwinRustAsyncSse extends RustOpaque {
  BoxDartDebugTwinRustAsyncSse.dcoDecode(List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  BoxDartDebugTwinRustAsyncSse.sseDecode(int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib.instance.api
        .rust_arc_increment_strong_count_BoxDartDebugTwinRustAsyncSse,
    rustArcDecrementStrongCount: RustLib.instance.api
        .rust_arc_decrement_strong_count_BoxDartDebugTwinRustAsyncSse,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_BoxDartDebugTwinRustAsyncSsePtr,
  );
}

@freezed
sealed class EnumOpaqueTwinRustAsyncSse with _$EnumOpaqueTwinRustAsyncSse {
  const factory EnumOpaqueTwinRustAsyncSse.struct(
    HideData field0,
  ) = EnumOpaqueTwinRustAsyncSse_Struct;
  const factory EnumOpaqueTwinRustAsyncSse.primitive(
    I32 field0,
  ) = EnumOpaqueTwinRustAsyncSse_Primitive;
  const factory EnumOpaqueTwinRustAsyncSse.traitObj(
    BoxDartDebugTwinRustAsyncSse field0,
  ) = EnumOpaqueTwinRustAsyncSse_TraitObj;
  const factory EnumOpaqueTwinRustAsyncSse.mutex(
    MutexHideData field0,
  ) = EnumOpaqueTwinRustAsyncSse_Mutex;
  const factory EnumOpaqueTwinRustAsyncSse.rwLock(
    RwLockHideData field0,
  ) = EnumOpaqueTwinRustAsyncSse_RwLock;
}

class EnumOpaqueTwinRustAsyncSseArray5
    extends NonGrowableListView<EnumOpaqueTwinRustAsyncSse> {
  static const arraySize = 5;

  @internal
  List<EnumOpaqueTwinRustAsyncSse> get inner => _inner;
  final List<EnumOpaqueTwinRustAsyncSse> _inner;

  EnumOpaqueTwinRustAsyncSseArray5(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  EnumOpaqueTwinRustAsyncSseArray5.init(EnumOpaqueTwinRustAsyncSse fill)
      : this(List<EnumOpaqueTwinRustAsyncSse>.filled(arraySize, fill));
}

/// [`HideData`] has private fields.
class OpaqueNestedTwinRustAsyncSse {
  final HideData first;
  final HideData second;

  const OpaqueNestedTwinRustAsyncSse({
    required this.first,
    required this.second,
  });

  @override
  int get hashCode => first.hashCode ^ second.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpaqueNestedTwinRustAsyncSse &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second;
}
