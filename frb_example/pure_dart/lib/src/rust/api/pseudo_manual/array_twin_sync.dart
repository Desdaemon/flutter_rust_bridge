// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import '../array.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

U8Array5 getArrayTwinSync({dynamic hint}) =>
    RustLib.instance.api.getArrayTwinSync(hint: hint);

PointTwinSyncArray2 getComplexArrayTwinSync({dynamic hint}) =>
    RustLib.instance.api.getComplexArrayTwinSync(hint: hint);

MessageIdTwinSync newMsgidTwinSync({required U8Array32 id, dynamic hint}) =>
    RustLib.instance.api.newMsgidTwinSync(id: id, hint: hint);

U8Array32 useMsgidTwinSync({required MessageIdTwinSync id, dynamic hint}) =>
    RustLib.instance.api.useMsgidTwinSync(id: id, hint: hint);

BlobTwinSync boxedBlobTwinSync({required U8Array1600 blob, dynamic hint}) =>
    RustLib.instance.api.boxedBlobTwinSync(blob: blob, hint: hint);

U8Array1600 useBoxedBlobTwinSync({required BlobTwinSync blob, dynamic hint}) =>
    RustLib.instance.api.useBoxedBlobTwinSync(blob: blob, hint: hint);

FeedIdTwinSync returnBoxedFeedIdTwinSync(
        {required U8Array8 id, dynamic hint}) =>
    RustLib.instance.api.returnBoxedFeedIdTwinSync(id: id, hint: hint);

U8Array8 returnBoxedRawFeedIdTwinSync(
        {required FeedIdTwinSync id, dynamic hint}) =>
    RustLib.instance.api.returnBoxedRawFeedIdTwinSync(id: id, hint: hint);

TestIdTwinSync funcTestIdTwinSync({required TestIdTwinSync id, dynamic hint}) =>
    RustLib.instance.api.funcTestIdTwinSync(id: id, hint: hint);

double lastNumberTwinSync({required F64Array16 array, dynamic hint}) =>
    RustLib.instance.api.lastNumberTwinSync(array: array, hint: hint);

TestIdTwinSyncArray2 nestedIdTwinSync(
        {required TestIdTwinSyncArray4 id, dynamic hint}) =>
    RustLib.instance.api.nestedIdTwinSync(id: id, hint: hint);

class BlobTwinSync {
  final U8Array1600 field0;

  const BlobTwinSync({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlobTwinSync &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class FeedIdTwinSync {
  final U8Array8 field0;

  const FeedIdTwinSync({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedIdTwinSync &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class MessageIdTwinSync {
  final U8Array32 field0;

  const MessageIdTwinSync({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageIdTwinSync &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class PointTwinSync {
  final double x;
  final double y;

  const PointTwinSync({
    required this.x,
    required this.y,
  });

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointTwinSync &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;
}

class PointTwinSyncArray2 extends NonGrowableListView<PointTwinSync> {
  static const arraySize = 2;

  @internal
  List<PointTwinSync> get inner => _inner;
  final List<PointTwinSync> _inner;

  PointTwinSyncArray2(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  PointTwinSyncArray2.init(PointTwinSync fill)
      : this(List<PointTwinSync>.filled(arraySize, fill));
}

class TestIdTwinSync {
  final I32Array2 field0;

  const TestIdTwinSync({
    required this.field0,
  });

  @override
  int get hashCode => field0.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestIdTwinSync &&
          runtimeType == other.runtimeType &&
          field0 == other.field0;
}

class TestIdTwinSyncArray2 extends NonGrowableListView<TestIdTwinSync> {
  static const arraySize = 2;

  @internal
  List<TestIdTwinSync> get inner => _inner;
  final List<TestIdTwinSync> _inner;

  TestIdTwinSyncArray2(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  TestIdTwinSyncArray2.init(TestIdTwinSync fill)
      : this(List<TestIdTwinSync>.filled(arraySize, fill));
}

class TestIdTwinSyncArray4 extends NonGrowableListView<TestIdTwinSync> {
  static const arraySize = 4;

  @internal
  List<TestIdTwinSync> get inner => _inner;
  final List<TestIdTwinSync> _inner;

  TestIdTwinSyncArray4(this._inner)
      : assert(_inner.length == arraySize),
        super(_inner);

  TestIdTwinSyncArray4.init(TestIdTwinSync fill)
      : this(List<TestIdTwinSync>.filled(arraySize, fill));
}
