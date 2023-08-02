// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.80.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated_api_block_2.io.dart' if (dart.library.html) 'bridge_generated_api_block_2.web.dart';
import 'bridge_generated_shares.dart';
export 'bridge_generated_shares.dart';
import 'bridge_generated_shares.io.dart' if (dart.library.html) 'bridge_generated_shares.web.dart';

class ApiBlock2ClassImpl implements ApiBlock2Class {
  final ApiBlock2ClassPlatform _platform;
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  final BridgeGeneratedSharesImpl _sharedImpl;

  factory ApiBlock2ClassImpl(ExternalLibrary dylib) {
    final platform = ApiBlock2ClassPlatform(dylib);
    final sharedPlatform = BridgeGeneratedSharesPlatform(dylib);
    final sharedImpl = BridgeGeneratedSharesImpl(dylib);
    return ApiBlock2ClassImpl.raw(platform, sharedPlatform, sharedImpl);
  }

  ApiBlock2ClassImpl.raw(this._platform, this._sharedPlatform, this._sharedImpl);

  /// Only valid on web/WASM platforms.
  factory ApiBlock2ClassImpl.wasm(FutureOr<WasmModule> module) => ApiBlock2ClassImpl(module as ExternalLibrary);

  Future<double> testInbuiltTypeInBlock2({required int a, required double b, dynamic hint}) {
    var arg0 = api2wire_i32(a);
    var arg1 = api2wire_f32(b);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_inbuilt_type_in_block_2(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_f32,
      constMeta: kTestInbuiltTypeInBlock2ConstMeta,
      argValues: [a, b],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestInbuiltTypeInBlock2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_inbuilt_type_in_block_2",
        argNames: ["a", "b"],
      );

  Future<String> testStringInBlock2({required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(s);
    var arg1 = _sharedPlatform.api2wire_u64(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_string_in_block_2(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStringInBlock2ConstMeta,
      argValues: [s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStringInBlock2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_string_in_block_2",
        argNames: ["s", "i"],
      );

  Future<SharedStructInAllBlocks> testAllSharedStructInBlock2(
      {required SharedStructInAllBlocks custom, required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_all_blocks(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i32(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_all_shared_struct_in_block_2(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_shared_struct_in_all_blocks,
      constMeta: kTestAllSharedStructInBlock2ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestAllSharedStructInBlock2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_all_shared_struct_in_block_2",
        argNames: ["custom", "s", "i"],
      );

  SharedStructInAllBlocks testAllSharedStructInSyncInBlock2(
      {required SharedStructInAllBlocks custom, required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_all_blocks(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i32(i);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_test_all_shared_struct_in_sync_in_block_2(arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_shared_struct_in_all_blocks,
      constMeta: kTestAllSharedStructInSyncInBlock2ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestAllSharedStructInSyncInBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_all_shared_struct_in_sync_in_block_2",
        argNames: ["custom", "s", "i"],
      );

  Future<SharedStructInBlock1And2> testSharedStructInBlock2For1And2(
      {required SharedStructInBlock1And2 custom, required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_block_1_and_2(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i32(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_shared_struct_in_block_2_for_1_and_2(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_shared_struct_in_block_1_and_2,
      constMeta: kTestSharedStructInBlock2For1And2ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestSharedStructInBlock2For1And2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_shared_struct_in_block_2_for_1_and_2",
        argNames: ["custom", "s", "i"],
      );

  Future<CrossSharedStructInBlock1And2> testCrossSharedStructInBlock2For1And2({required String name, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(name);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_cross_shared_struct_in_block_2_for_1_and_2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_cross_shared_struct_in_block_1_and_2,
      constMeta: kTestCrossSharedStructInBlock2For1And2ConstMeta,
      argValues: [name],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestCrossSharedStructInBlock2For1And2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_cross_shared_struct_in_block_2_for_1_and_2",
        argNames: ["name"],
      );

  Future<SharedStructInBlock2And3> testSharedStructInBlock2For2And3(
      {required SharedStructInBlock2And3 custom, required String s, required int i, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_shared_struct_in_block_2_and_3(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i32(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_shared_struct_in_block_2_for_2_and_3(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_shared_struct_in_block_2_and_3,
      constMeta: kTestSharedStructInBlock2For2And3ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestSharedStructInBlock2For2And3ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_shared_struct_in_block_2_for_2_and_3",
        argNames: ["custom", "s", "i"],
      );

  Future<String> testCrossSharedStructInBlock2For2And3({required CrossSharedStructInBlock2And3 custom, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_box_autoadd_cross_shared_struct_in_block_2_and_3(custom);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_cross_shared_struct_in_block_2_for_2_and_3(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestCrossSharedStructInBlock2For2And3ConstMeta,
      argValues: [custom],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestCrossSharedStructInBlock2For2And3ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_cross_shared_struct_in_block_2_for_2_and_3",
        argNames: ["custom"],
      );

  Future<StructOnlyForBlock2> testUniqueStruct2(
      {required StructOnlyForBlock2 custom, required String s, required int i, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_only_for_block_2(custom);
    var arg1 = _sharedPlatform.api2wire_String(s);
    var arg2 = api2wire_i16(i);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_unique_struct_2(port_, arg0, arg1, arg2),
      parseSuccessData: (d) => _wire2api_struct_only_for_block_2(d),
      constMeta: kTestUniqueStruct2ConstMeta,
      argValues: [custom, s, i],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestUniqueStruct2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_unique_struct_2",
        argNames: ["custom", "s", "i"],
      );

  Future<String> testStructDefinedInBlock2({required StructDefinedInBlock2 custom, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_defined_in_block_2(custom);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_struct_defined_in_block_2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStructDefinedInBlock2ConstMeta,
      argValues: [custom],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStructDefinedInBlock2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_struct_defined_in_block_2",
        argNames: ["custom"],
      );

  Future<String> testEnumDefinedInBlock2({required EnumDefinedInBlock2 custom, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_enum_defined_in_block_2(custom);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_enum_defined_in_block_2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestEnumDefinedInBlock2ConstMeta,
      argValues: [custom],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestEnumDefinedInBlock2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_enum_defined_in_block_2",
        argNames: ["custom"],
      );

  Future<String> testListInBlock2(
      {required List<SharedStructInAllBlocks> sharedStructs,
      required List<String> strings,
      required Int32List nums,
      required List<SharedWeekdaysEnumInAllBlocks> weekdays,
      required List<StructDefinedInBlock2> structList,
      required List<EnumDefinedInBlock2> enumList,
      dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_list_shared_struct_in_all_blocks(sharedStructs);
    var arg1 = _sharedPlatform.api2wire_StringList(strings);
    var arg2 = _sharedPlatform.api2wire_int_32_list(nums);
    var arg3 = _sharedPlatform.api2wire_list_shared_weekdays_enum_in_all_blocks(weekdays);
    var arg4 = _platform.api2wire_list_struct_defined_in_block_2(structList);
    var arg5 = _platform.api2wire_list_enum_defined_in_block_2(enumList);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_list_in_block_2(port_, arg0, arg1, arg2, arg3, arg4, arg5),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestListInBlock2ConstMeta,
      argValues: [sharedStructs, strings, nums, weekdays, structList, enumList],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestListInBlock2ConstMeta => const FlutterRustBridgeTaskConstMeta(
        debugName: "test_list_in_block_2",
        argNames: ["sharedStructs", "strings", "nums", "weekdays", "structList", "enumList"],
      );

  Future<String> testMethodMethodEnumDefinedInBlock2(
      {required EnumDefinedInBlock2 that, required String message, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_enum_defined_in_block_2(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__EnumDefinedInBlock2(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodEnumDefinedInBlock2ConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodEnumDefinedInBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__EnumDefinedInBlock2",
        argNames: ["that", "message"],
      );

  Future<String> testStaticMethodStaticMethodEnumDefinedInBlock2({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__EnumDefinedInBlock2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodEnumDefinedInBlock2ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodEnumDefinedInBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__EnumDefinedInBlock2",
        argNames: ["message"],
      );

  Future<String> testMethodMethodStructDefinedInBlock2(
      {required StructDefinedInBlock2 that, required String message, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_defined_in_block_2(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__StructDefinedInBlock2(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodStructDefinedInBlock2ConstMeta,
      argValues: [that, message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodStructDefinedInBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__StructDefinedInBlock2",
        argNames: ["that", "message"],
      );

  Future<String> testStaticMethodStaticMethodStructDefinedInBlock2({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__StructDefinedInBlock2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodStructDefinedInBlock2ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodStructDefinedInBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__StructDefinedInBlock2",
        argNames: ["message"],
      );

  Future<String> testMethodMethodStructOnlyForBlock2(
      {required StructOnlyForBlock2 that, required String message, required int num, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_struct_only_for_block_2(that);
    var arg1 = _sharedPlatform.api2wire_String(message);
    var arg2 = api2wire_u16(num);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_method__method__StructOnlyForBlock2(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestMethodMethodStructOnlyForBlock2ConstMeta,
      argValues: [that, message, num],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestMethodMethodStructOnlyForBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_method__method__StructOnlyForBlock2",
        argNames: ["that", "message", "num"],
      );

  Future<String> testStaticMethodStaticMethodStructOnlyForBlock2({required String message, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(message);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_static_method__static_method__StructOnlyForBlock2(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kTestStaticMethodStaticMethodStructOnlyForBlock2ConstMeta,
      argValues: [message],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestStaticMethodStaticMethodStructOnlyForBlock2ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_static_method__static_method__StructOnlyForBlock2",
        argNames: ["message"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  int _wire2api_i16(dynamic raw) {
    return raw as int;
  }

  StructOnlyForBlock2 _wire2api_struct_only_for_block_2(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3) throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return StructOnlyForBlock2(
      bridge: this,
      id: _wire2api_i16(arr[0]),
      num: _sharedImpl.wire2api_f64(arr[1]),
      name: _sharedImpl.wire2api_String(arr[2]),
    );
  }
}

// Section: api2wire

@protected
int api2wire_i16(int raw) {
  return raw;
}

// Section: finalizer
