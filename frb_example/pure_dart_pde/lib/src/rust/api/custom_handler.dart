// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.32.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::rust_async::RwLock<:: flutter_rust_bridge :: DefaultHandler < :: flutter_rust_bridge :: for_generated :: SimpleThreadPool >>>
@sealed
class FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPool
    extends RustOpaque {
  FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPool.dcoDecode(
      List<dynamic> wire)
      : super.dcoDecode(wire, _kStaticData);

  FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPool.sseDecode(
      int ptr, int externalSizeOnNative)
      : super.sseDecode(ptr, externalSizeOnNative, _kStaticData);

  static final _kStaticData = RustArcStaticData(
    rustArcIncrementStrongCount: RustLib.instance.api
        .rust_arc_increment_strong_count_FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPool,
    rustArcDecrementStrongCount: RustLib.instance.api
        .rust_arc_decrement_strong_count_FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPool,
    rustArcDecrementStrongCountPtr: RustLib.instance.api
        .rust_arc_decrement_strong_count_FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPoolPtr,
  );
}

class FLUTTER_RUST_BRIDGE_HANDLER {
  final void privateField;

  const FLUTTER_RUST_BRIDGE_HANDLER({
    required this.privateField,
  });

  Future<FlutterRustBridgeDefaultHandlerFlutterRustBridgeForGeneratedSimpleThreadPool>
      deref({dynamic hint}) => RustLib.instance.api
          .flutterRustBridgeHandlerDeref(that: this, hint: hint);

  static Future<void> initialize(
          {required FLUTTER_RUST_BRIDGE_HANDLER lazy, dynamic hint}) =>
      RustLib.instance.api
          .flutterRustBridgeHandlerInitialize(lazy: lazy, hint: hint);

  @override
  int get hashCode => privateField.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FLUTTER_RUST_BRIDGE_HANDLER &&
          runtimeType == other.runtimeType &&
          privateField == other.privateField;
}
