// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import '../dart_opaque.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'dart_opaque_twin_sse.freezed.dart';

Future<String> asyncAcceptDartOpaqueTwinSse(
        {required Object opaque, dynamic hint}) =>
    RustLib.instance.api
        .asyncAcceptDartOpaqueTwinSse(opaque: opaque, hint: hint);

Future<Object> loopBackTwinSse({required Object opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackTwinSse(opaque: opaque, hint: hint);

Future<Object?> loopBackOptionTwinSse({required Object opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackOptionTwinSse(opaque: opaque, hint: hint);

Future<ObjectArray1> loopBackArrayTwinSse(
        {required Object opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackArrayTwinSse(opaque: opaque, hint: hint);

Future<List<Object>> loopBackVecTwinSse(
        {required Object opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackVecTwinSse(opaque: opaque, hint: hint);

Future<void> loopBackOptionGetTwinSse({Object? opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackOptionGetTwinSse(opaque: opaque, hint: hint);

Future<void> loopBackArrayGetTwinSse(
        {required ObjectArray1 opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackArrayGetTwinSse(opaque: opaque, hint: hint);

Future<void> loopBackVecGetTwinSse(
        {required List<Object> opaque, dynamic hint}) =>
    RustLib.instance.api.loopBackVecGetTwinSse(opaque: opaque, hint: hint);

/// [DartWrapObject] cannot be obtained
/// on a thread other than the thread it was created on.
Future<void> panicUnwrapDartOpaqueTwinSse(
        {required Object opaque, dynamic hint}) =>
    RustLib.instance.api
        .panicUnwrapDartOpaqueTwinSse(opaque: opaque, hint: hint);

Future<DartOpaqueNestedTwinSse> createNestedDartOpaqueTwinSse(
        {required Object opaque1, required Object opaque2, dynamic hint}) =>
    RustLib.instance.api.createNestedDartOpaqueTwinSse(
        opaque1: opaque1, opaque2: opaque2, hint: hint);

Future<void> getNestedDartOpaqueTwinSse(
        {required DartOpaqueNestedTwinSse opaque, dynamic hint}) =>
    RustLib.instance.api.getNestedDartOpaqueTwinSse(opaque: opaque, hint: hint);

Future<EnumDartOpaqueTwinSse> createEnumDartOpaqueTwinSse(
        {required Object opaque, dynamic hint}) =>
    RustLib.instance.api
        .createEnumDartOpaqueTwinSse(opaque: opaque, hint: hint);

Future<void> getEnumDartOpaqueTwinSse(
        {required EnumDartOpaqueTwinSse opaque, dynamic hint}) =>
    RustLib.instance.api.getEnumDartOpaqueTwinSse(opaque: opaque, hint: hint);

Future<void> setStaticDartOpaqueTwinSse(
        {required int id, required Object opaque, dynamic hint}) =>
    RustLib.instance.api
        .setStaticDartOpaqueTwinSse(id: id, opaque: opaque, hint: hint);

Future<void> dropStaticDartOpaqueTwinSse({required int id, dynamic hint}) =>
    RustLib.instance.api.dropStaticDartOpaqueTwinSse(id: id, hint: hint);

Future<List<Object>> cloneDartOpaqueTwinSse(
        {required Object opaque, dynamic hint}) =>
    RustLib.instance.api.cloneDartOpaqueTwinSse(opaque: opaque, hint: hint);

class DartOpaqueNestedTwinSse {
  final Object first;
  final Object second;

  const DartOpaqueNestedTwinSse({
    required this.first,
    required this.second,
  });

  @override
  int get hashCode => first.hashCode ^ second.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DartOpaqueNestedTwinSse &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second;
}

@freezed
sealed class EnumDartOpaqueTwinSse with _$EnumDartOpaqueTwinSse {
  const factory EnumDartOpaqueTwinSse.primitive(
    int field0,
  ) = EnumDartOpaqueTwinSse_Primitive;
  const factory EnumDartOpaqueTwinSse.opaque(
    Object field0,
  ) = EnumDartOpaqueTwinSse_Opaque;
}
