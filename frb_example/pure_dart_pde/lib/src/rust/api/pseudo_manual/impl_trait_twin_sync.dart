// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.37.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

int funcArgTraitImplTwinSync(
        {required SimpleTraitForDynTwinSyncImplementor arg}) =>
    RustLib.instance.api
        .crateApiPseudoManualImplTraitTwinSyncFuncArgTraitImplTwinSync(
            arg: arg);

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<StructOneWithTraitForDynTwinSync>>
abstract class StructOneWithTraitForDynTwinSync
    implements RustOpaqueInterface, SimpleTraitForDynTwinSync {
  static StructOneWithTraitForDynTwinSync createTwinSync({required int one}) =>
      RustLib.instance.api
          .crateApiPseudoManualImplTraitTwinSyncStructOneWithTraitForDynTwinSyncCreateTwinSync(
              one: one);

  int get one;

  void set one(int one);

  Future<int> simpleMethodTwinSync();
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<StructOneWithTraitTwinSync>>
abstract class StructOneWithTraitTwinSync
    implements RustOpaqueInterface, SimpleTraitTwinSync {
  int get one;

  void set one(int one);

  Future<int> simpleTraitFnReceiverBorrowTwinSync();

  static Future<StructOneWithTraitTwinSync> simpleTraitFnTwinSync(
          {required int value}) =>
      RustLib.instance.api
          .crateApiPseudoManualImplTraitTwinSyncStructOneWithTraitTwinSyncSimpleTraitFnTwinSync(
              value: value);

  static Future<int> simpleTraitFnWithDefaultImplTwinSync() => RustLib
      .instance.api
      .crateApiPseudoManualImplTraitTwinSyncStructOneWithTraitTwinSyncSimpleTraitFnWithDefaultImplTwinSync();
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<StructTwoWithTraitForDynTwinSync>>
abstract class StructTwoWithTraitForDynTwinSync
    implements RustOpaqueInterface, SimpleTraitForDynTwinSync {
  int get two;

  void set two(int two);

  Future<int> simpleMethodTwinSync();
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<StructTwoWithTraitTwinSync>>
abstract class StructTwoWithTraitTwinSync
    implements RustOpaqueInterface, SimpleTraitTwinSync {
  int get two;

  void set two(int two);

  Future<int> simpleTraitFnReceiverBorrowTwinSync();

  static Future<StructTwoWithTraitTwinSync> simpleTraitFnTwinSync(
          {required int value}) =>
      RustLib.instance.api
          .crateApiPseudoManualImplTraitTwinSyncStructTwoWithTraitTwinSyncSimpleTraitFnTwinSync(
              value: value);

  static Future<int> simpleTraitFnWithDefaultImplTwinSync() => RustLib
      .instance.api
      .crateApiPseudoManualImplTraitTwinSyncStructTwoWithTraitTwinSyncSimpleTraitFnWithDefaultImplTwinSync();
}

abstract class SimpleTraitForDynTwinSync {
  Future<int> simpleMethodTwinSync();
}

abstract class SimpleTraitTwinSync {
  Future<int> simpleTraitFnReceiverBorrowTwinSync();
}
