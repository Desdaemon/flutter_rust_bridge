// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../auxiliary/sample_types.dart';
import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

String funcStringTwinSyncSse({required String arg, dynamic hint}) =>
    RustLib.instance.api.funcStringTwinSyncSse(arg: arg, hint: hint);

void funcReturnUnitTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.funcReturnUnitTwinSyncSse(hint: hint);

List<MySize> handleListOfStructTwinSyncSse(
        {required List<MySize> l, dynamic hint}) =>
    RustLib.instance.api.handleListOfStructTwinSyncSse(l: l, hint: hint);

List<String> handleStringListTwinSyncSse(
        {required List<String> names, dynamic hint}) =>
    RustLib.instance.api.handleStringListTwinSyncSse(names: names, hint: hint);

EmptyTwinSyncSse emptyStructTwinSyncSse(
        {required EmptyTwinSyncSse empty, dynamic hint}) =>
    RustLib.instance.api.emptyStructTwinSyncSse(empty: empty, hint: hint);

class EmptyTwinSyncSse {
  const EmptyTwinSyncSse();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmptyTwinSyncSse && runtimeType == other.runtimeType;
}
