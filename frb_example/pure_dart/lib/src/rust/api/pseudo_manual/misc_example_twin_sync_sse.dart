// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.13.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../auxiliary/sample_types.dart';
import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'misc_example_twin_sync_sse.freezed.dart';

MyTreeNodeTwinSyncSse handleComplexStructTwinSyncSse(
        {required MyTreeNodeTwinSyncSse s, dynamic hint}) =>
    RustLib.instance.api.handleComplexStructTwinSyncSse(s: s, hint: hint);

List<WeekdaysTwinSyncSse> listOfPrimitiveEnumsTwinSyncSse(
        {required List<WeekdaysTwinSyncSse> weekdays, dynamic hint}) =>
    RustLib.instance.api
        .listOfPrimitiveEnumsTwinSyncSse(weekdays: weekdays, hint: hint);

MyNestedStructTwinSyncSse handleNestedStructTwinSyncSse(
        {required MyNestedStructTwinSyncSse s, dynamic hint}) =>
    RustLib.instance.api.handleNestedStructTwinSyncSse(s: s, hint: hint);

BigBuffersTwinSyncSse handleBigBuffersTwinSyncSse({dynamic hint}) =>
    RustLib.instance.api.handleBigBuffersTwinSyncSse(hint: hint);

AbcTwinSyncSse testAbcEnumTwinSyncSse(
        {required AbcTwinSyncSse abc, dynamic hint}) =>
    RustLib.instance.api.testAbcEnumTwinSyncSse(abc: abc, hint: hint);

StructWithEnumTwinSyncSse testStructWithEnumTwinSyncSse(
        {required StructWithEnumTwinSyncSse se, dynamic hint}) =>
    RustLib.instance.api.testStructWithEnumTwinSyncSse(se: se, hint: hint);

String handleStringTwinSyncSse({required String s, dynamic hint}) =>
    RustLib.instance.api.handleStringTwinSyncSse(s: s, hint: hint);

Uint8List handleVecU8TwinSyncSse({required List<int> v, dynamic hint}) =>
    RustLib.instance.api.handleVecU8TwinSyncSse(v: v, hint: hint);

MySize handleStructTwinSyncSse(
        {required MySize arg, required MySize boxed, dynamic hint}) =>
    RustLib.instance.api
        .handleStructTwinSyncSse(arg: arg, boxed: boxed, hint: hint);

class ATwinSyncSse {
  final String a;

  const ATwinSyncSse({
    required this.a,
  });

  @override
  int get hashCode => a.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ATwinSyncSse && runtimeType == other.runtimeType && a == other.a;
}

@freezed
sealed class AbcTwinSyncSse with _$AbcTwinSyncSse {
  const factory AbcTwinSyncSse.a(
    ATwinSyncSse field0,
  ) = AbcTwinSyncSse_A;
  const factory AbcTwinSyncSse.b(
    BTwinSyncSse field0,
  ) = AbcTwinSyncSse_B;
  const factory AbcTwinSyncSse.c(
    CTwinSyncSse field0,
  ) = AbcTwinSyncSse_C;
  const factory AbcTwinSyncSse.justInt(
    int field0,
  ) = AbcTwinSyncSse_JustInt;
}

class BTwinSyncSse {
  final int b;

  const BTwinSyncSse({
    required this.b,
  });

  @override
  int get hashCode => b.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BTwinSyncSse && runtimeType == other.runtimeType && b == other.b;
}

class BigBuffersTwinSyncSse {
  final Int64List int64;
  final Uint64List uint64;

  const BigBuffersTwinSyncSse({
    required this.int64,
    required this.uint64,
  });

  @override
  int get hashCode => int64.hashCode ^ uint64.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BigBuffersTwinSyncSse &&
          runtimeType == other.runtimeType &&
          int64 == other.int64 &&
          uint64 == other.uint64;
}

class CTwinSyncSse {
  final bool c;

  const CTwinSyncSse({
    required this.c,
  });

  @override
  int get hashCode => c.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CTwinSyncSse && runtimeType == other.runtimeType && c == other.c;
}

class MyNestedStructTwinSyncSse {
  final MyTreeNodeTwinSyncSse treeNode;
  final WeekdaysTwinSyncSse weekday;

  const MyNestedStructTwinSyncSse({
    required this.treeNode,
    required this.weekday,
  });

  @override
  int get hashCode => treeNode.hashCode ^ weekday.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyNestedStructTwinSyncSse &&
          runtimeType == other.runtimeType &&
          treeNode == other.treeNode &&
          weekday == other.weekday;
}

class MyTreeNodeTwinSyncSse {
  final int valueI32;
  final Uint8List valueVecU8;
  final bool valueBoolean;
  final List<MyTreeNodeTwinSyncSse> children;

  const MyTreeNodeTwinSyncSse({
    required this.valueI32,
    required this.valueVecU8,
    required this.valueBoolean,
    required this.children,
  });

  @override
  int get hashCode =>
      valueI32.hashCode ^
      valueVecU8.hashCode ^
      valueBoolean.hashCode ^
      children.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTreeNodeTwinSyncSse &&
          runtimeType == other.runtimeType &&
          valueI32 == other.valueI32 &&
          valueVecU8 == other.valueVecU8 &&
          valueBoolean == other.valueBoolean &&
          children == other.children;
}

class StructWithEnumTwinSyncSse {
  final AbcTwinSyncSse abc1;
  final AbcTwinSyncSse abc2;

  const StructWithEnumTwinSyncSse({
    required this.abc1,
    required this.abc2,
  });

  @override
  int get hashCode => abc1.hashCode ^ abc2.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructWithEnumTwinSyncSse &&
          runtimeType == other.runtimeType &&
          abc1 == other.abc1 &&
          abc2 == other.abc2;
}

enum WeekdaysTwinSyncSse {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
