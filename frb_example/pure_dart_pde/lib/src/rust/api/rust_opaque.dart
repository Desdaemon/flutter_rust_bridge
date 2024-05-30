// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.36.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'pseudo_manual/rust_opaque_twin_rust_async.dart';
part 'rust_opaque.freezed.dart';

Future<HideDataTwinNormal> createOpaqueTwinNormal() =>
    RustLib.instance.api.crateApiRustOpaqueCreateOpaqueTwinNormal();

Future<HideDataTwinNormal?> createOptionOpaqueTwinNormal(
        {HideDataTwinNormal? opaque}) =>
    RustLib.instance.api
        .crateApiRustOpaqueCreateOptionOpaqueTwinNormal(opaque: opaque);

Future<EnumOpaqueTwinNormalArray5> createArrayOpaqueEnumTwinNormal() =>
    RustLib.instance.api.crateApiRustOpaqueCreateArrayOpaqueEnumTwinNormal();

Future<String> runEnumOpaqueTwinNormal(
        {required EnumOpaqueTwinNormal opaque}) =>
    RustLib.instance.api
        .crateApiRustOpaqueRunEnumOpaqueTwinNormal(opaque: opaque);

Future<String> runOpaqueTwinNormal({required HideDataTwinNormal opaque}) =>
    RustLib.instance.api.crateApiRustOpaqueRunOpaqueTwinNormal(opaque: opaque);

Future<String> runOpaqueWithDelayTwinNormal(
        {required HideDataTwinNormal opaque}) =>
    RustLib.instance.api
        .crateApiRustOpaqueRunOpaqueWithDelayTwinNormal(opaque: opaque);

Future<HideDataTwinNormalArray2> opaqueArrayTwinNormal() =>
    RustLib.instance.api.crateApiRustOpaqueOpaqueArrayTwinNormal();

Future<String> runNonCloneTwinNormal({required NonCloneDataTwinNormal clone}) =>
    RustLib.instance.api.crateApiRustOpaqueRunNonCloneTwinNormal(clone: clone);

Future<void> opaqueArrayRunTwinNormal(
        {required HideDataTwinNormalArray2 data}) =>
    RustLib.instance.api.crateApiRustOpaqueOpaqueArrayRunTwinNormal(data: data);

Future<List<HideDataTwinNormal>> opaqueVecTwinNormal() =>
    RustLib.instance.api.crateApiRustOpaqueOpaqueVecTwinNormal();

Future<void> opaqueVecRunTwinNormal({required List<HideDataTwinNormal> data}) =>
    RustLib.instance.api.crateApiRustOpaqueOpaqueVecRunTwinNormal(data: data);

Future<OpaqueNestedTwinNormal> createNestedOpaqueTwinNormal() =>
    RustLib.instance.api.crateApiRustOpaqueCreateNestedOpaqueTwinNormal();

Future<void> runNestedOpaqueTwinNormal(
        {required OpaqueNestedTwinNormal opaque}) =>
    RustLib.instance.api
        .crateApiRustOpaqueRunNestedOpaqueTwinNormal(opaque: opaque);

Future<String> unwrapRustOpaqueTwinNormal(
        {required HideDataTwinNormal opaque}) =>
    RustLib.instance.api
        .crateApiRustOpaqueUnwrapRustOpaqueTwinNormal(opaque: opaque);

/// Function to check the code generator.
/// FrbOpaqueReturn must be only return type.
/// FrbOpaqueReturn must not be used as an argument.
Future<FrbOpaqueReturnTwinNormal> frbGeneratorTestTwinNormal() =>
    RustLib.instance.api.crateApiRustOpaqueFrbGeneratorTestTwinNormal();

// Rust type: RustOpaqueMoi<Box < dyn DartDebugTwinNormal >>
@sealed
class BoxDartDebugTwinNormal extends RustOpaque {
  // Not to be used by end users
  BoxDartDebugTwinNormal.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  BoxDartDebugTwinNormal.frbInternalSseDecode(
      BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_BoxDartDebugTwinNormal,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_BoxDartDebugTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_BoxDartDebugTwinNormalPtr,
  );
}

// Rust type: RustOpaqueMoi<FrbOpaqueReturnTwinNormal>
@sealed
class FrbOpaqueReturnTwinNormal extends RustOpaque {
  // Not to be used by end users
  FrbOpaqueReturnTwinNormal.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  FrbOpaqueReturnTwinNormal.frbInternalSseDecode(
      BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_FrbOpaqueReturnTwinNormal,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_FrbOpaqueReturnTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_FrbOpaqueReturnTwinNormalPtr,
  );
}

// Rust type: RustOpaqueMoi<HideDataTwinNormal>
@sealed
class HideDataTwinNormal extends RustOpaque {
  // Not to be used by end users
  HideDataTwinNormal.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  HideDataTwinNormal.frbInternalSseDecode(BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount:
        RustLib.instance.api.rust_arc_increment_strong_count_HideDataTwinNormal,
    rustArcDecrementStrongCount:
        RustLib.instance.api.rust_arc_decrement_strong_count_HideDataTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_HideDataTwinNormalPtr,
  );
}

class HideDataTwinNormalArray2 extends NonGrowableListView<HideDataTwinNormal> {
  static const arraySize = 2;

  @internal
  List<HideDataTwinNormal> get inner => _inner;
  final List<HideDataTwinNormal> _inner;

  HideDataTwinNormalArray2(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  HideDataTwinNormalArray2.init(HideDataTwinNormal fill)
      : this(List<HideDataTwinNormal>.filled(arraySize, fill));
}

// Rust type: RustOpaqueMoi<Mutex < HideDataTwinNormal >>
@sealed
class MutexHideDataTwinNormal extends RustOpaque {
  // Not to be used by end users
  MutexHideDataTwinNormal.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  MutexHideDataTwinNormal.frbInternalSseDecode(
      BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_MutexHideDataTwinNormal,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_MutexHideDataTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_MutexHideDataTwinNormalPtr,
  );
}

// Rust type: RustOpaqueMoi<NonCloneDataTwinNormal>
@sealed
class NonCloneDataTwinNormal extends RustOpaque {
  // Not to be used by end users
  NonCloneDataTwinNormal.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  NonCloneDataTwinNormal.frbInternalSseDecode(
      BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_NonCloneDataTwinNormal,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_NonCloneDataTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib
        .instance.api.rust_arc_decrement_strong_count_NonCloneDataTwinNormalPtr,
  );
}

// Rust type: RustOpaqueMoi<RwLock < HideDataTwinNormal >>
@sealed
class RwLockHideDataTwinNormal extends RustOpaque {
  // Not to be used by end users
  RwLockHideDataTwinNormal.frbInternalDcoDecode(List<dynamic> wire)
      : super.frbInternalDcoDecode(wire, _kStaticData);

  // Not to be used by end users
  RwLockHideDataTwinNormal.frbInternalSseDecode(
      BigInt ptr, int externalSizeOnNative)
      : super.frbInternalSseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib
        .instance.api.rust_arc_increment_strong_count_RwLockHideDataTwinNormal,
    rustArcDecrementStrongCount: RustLib
        .instance.api.rust_arc_decrement_strong_count_RwLockHideDataTwinNormal,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_RwLockHideDataTwinNormalPtr,
  );
}

@freezed
sealed class EnumOpaqueTwinNormal with _$EnumOpaqueTwinNormal {
  const EnumOpaqueTwinNormal._();

  const factory EnumOpaqueTwinNormal.struct(
    HideDataTwinNormal field0,
  ) = EnumOpaqueTwinNormal_Struct;
  const factory EnumOpaqueTwinNormal.primitive(
    I32 field0,
  ) = EnumOpaqueTwinNormal_Primitive;
  const factory EnumOpaqueTwinNormal.traitObj(
    BoxDartDebugTwinNormal field0,
  ) = EnumOpaqueTwinNormal_TraitObj;
  const factory EnumOpaqueTwinNormal.mutex(
    MutexHideDataTwinNormal field0,
  ) = EnumOpaqueTwinNormal_Mutex;
  const factory EnumOpaqueTwinNormal.rwLock(
    RwLockHideDataTwinNormal field0,
  ) = EnumOpaqueTwinNormal_RwLock;
  const factory EnumOpaqueTwinNormal.nothing() = EnumOpaqueTwinNormal_Nothing;
}

class EnumOpaqueTwinNormalArray5
    extends NonGrowableListView<EnumOpaqueTwinNormal> {
  static const arraySize = 5;

  @internal
  List<EnumOpaqueTwinNormal> get inner => _inner;
  final List<EnumOpaqueTwinNormal> _inner;

  EnumOpaqueTwinNormalArray5(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  EnumOpaqueTwinNormalArray5.init(EnumOpaqueTwinNormal fill)
      : this(List<EnumOpaqueTwinNormal>.filled(arraySize, fill));
}

/// [`HideDataTwinNormal`] has private fields.
class OpaqueNestedTwinNormal {
  final HideDataTwinNormal first;
  final HideDataTwinNormal second;

  const OpaqueNestedTwinNormal({
    required this.first,
    required this.second,
  });

  @override
  int get hashCode => first.hashCode ^ second.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpaqueNestedTwinNormal &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second;
}
