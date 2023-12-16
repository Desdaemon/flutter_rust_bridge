// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 1.82.4.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'api/minimal.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  FutureOr<void> Function() dco_decode_DartFn_Inputs__Output_unit(dynamic raw);

  @protected
  Object dco_decode_DartOpaque(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  int dco_decode_usize(dynamic raw);

  @protected
  Object sse_decode_DartOpaque(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_usize(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  DartOpaqueWireType cst_encode_DartOpaque(Object raw) {
    return wire.dart_opaque_dart2rust_encode(raw, TODO);
  }

  @protected
  DartOpaqueWireType cst_encode_DartFn_Inputs__Output_unit(
      FutureOr<void> Function() raw);

  @protected
  int cst_encode_i_32(int raw);

  @protected
  void cst_encode_unit(void raw);

  @protected
  int cst_encode_usize(int raw);

  @protected
  void sse_encode_DartFn_Inputs__Output_unit(
      FutureOr<void> Function() self, SseSerializer serializer);

  @protected
  void sse_encode_DartOpaque(Object self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(int self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);
}

// Section: wire_class

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names
// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustLibWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void dart_fn_deliver_output(
    int call_id,
    ffi.Pointer<ffi.Uint8> ptr_,
    int rust_vec_len_,
    int data_len_,
  ) {
    return _dart_fn_deliver_output(
      call_id,
      ptr_,
      rust_vec_len_,
      data_len_,
    );
  }

  late final _dart_fn_deliver_outputPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int32, ffi.Pointer<ffi.Uint8>, ffi.Int32,
              ffi.Int32)>>('dart_fn_deliver_output');
  late final _dart_fn_deliver_output = _dart_fn_deliver_outputPtr
      .asFunction<void Function(int, ffi.Pointer<ffi.Uint8>, int, int)>();

  void wire_hi_1(
    int port_,
    ffi.Pointer<ffi.Void> callback,
  ) {
    return _wire_hi_1(
      port_,
      callback,
    );
  }

  late final _wire_hi_1Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<ffi.Void>)>>('wire_hi_1');
  late final _wire_hi_1 =
      _wire_hi_1Ptr.asFunction<void Function(int, ffi.Pointer<ffi.Void>)>();

  void wire_hi_2(
    int port_,
    ffi.Pointer<ffi.Void> opaque,
  ) {
    return _wire_hi_2(
      port_,
      opaque,
    );
  }

  late final _wire_hi_2Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<ffi.Void>)>>('wire_hi_2');
  late final _wire_hi_2 =
      _wire_hi_2Ptr.asFunction<void Function(int, ffi.Pointer<ffi.Void>)>();

  void wire_minimal_adder(
    int port_,
    int a,
    int b,
  ) {
    return _wire_minimal_adder(
      port_,
      a,
      b,
    );
  }

  late final _wire_minimal_adderPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32, ffi.Int32)>>(
      'wire_minimal_adder');
  late final _wire_minimal_adder =
      _wire_minimal_adderPtr.asFunction<void Function(int, int, int)>();

  ffi.Pointer<ffi.Void> dart_opaque_dart2rust_encode(
    Object handle,
    int dart_handler_port,
  ) {
    return _dart_opaque_dart2rust_encode(
      handle,
      dart_handler_port,
    );
  }

  late final _dart_opaque_dart2rust_encodePtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Handle, ffi.Int64)>>('dart_opaque_dart2rust_encode');
  late final _dart_opaque_dart2rust_encode = _dart_opaque_dart2rust_encodePtr
      .asFunction<ffi.Pointer<ffi.Void> Function(Object, int)>();

  int dummy_method_to_enforce_bundling() {
    return _dummy_method_to_enforce_bundling();
  }

  late final _dummy_method_to_enforce_bundlingPtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>(
          'dummy_method_to_enforce_bundling');
  late final _dummy_method_to_enforce_bundling =
      _dummy_method_to_enforce_bundlingPtr.asFunction<int Function()>();
}
