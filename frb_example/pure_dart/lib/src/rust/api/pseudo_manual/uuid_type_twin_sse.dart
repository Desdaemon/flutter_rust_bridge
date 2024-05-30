// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.36.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:uuid/uuid.dart';

// The functions `fmt`, `clone` are not `pub`, thus are ignored.

Future<UuidValue> handleUuidTwinSse({required UuidValue id}) =>
    RustLib.instance.api
        .crateApiPseudoManualUuidTypeTwinSseHandleUuidTwinSse(id: id);

Future<List<UuidValue>> handleUuidsTwinSse({required List<UuidValue> ids}) =>
    RustLib.instance.api
        .crateApiPseudoManualUuidTypeTwinSseHandleUuidsTwinSse(ids: ids);

Future<FeatureUuidTwinSse> handleNestedUuidsTwinSse(
        {required FeatureUuidTwinSse ids}) =>
    RustLib.instance.api
        .crateApiPseudoManualUuidTypeTwinSseHandleNestedUuidsTwinSse(ids: ids);

class FeatureUuidTwinSse {
  final UuidValue one;

  const FeatureUuidTwinSse({
    required this.one,
  });

  @override
  int get hashCode => one.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureUuidTwinSse &&
          runtimeType == other.runtimeType &&
          one == other.one;
}
