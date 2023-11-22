// ignore_for_file: unused_import, unused_element

import 'api/simple.dart';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'api/comment.dart';
import 'api/primitive.dart';
import 'api/sync.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
  });

  @protected
  ffi.Pointer<wire_struct_with_comments>
      api2wire_box_autoadd_struct_with_comments(StructWithComments raw) {
    final ptr = wire.new_box_autoadd_struct_with_comments();
    _api_fill_to_wire_struct_with_comments(raw, ptr.ref);
    return ptr;
  }

  @protected
  BigInt api2wire_i_64(BigInt raw) {
    return raw;
  }

  @protected
  BigInt api2wire_u_64(BigInt raw) {
    return raw;
  }
}

// Section: c_binding

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names
// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class RustLibWire implements BaseWire {
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

  void wire_StructWithComments_instance_method(
    int port_,
    ffi.Pointer<wire_struct_with_comments> that,
  ) {
    return _wire_StructWithComments_instance_method(
      port_,
      that,
    );
  }

  late final _wire_StructWithComments_instance_methodPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64, ffi.Pointer<wire_struct_with_comments>)>>(
      'wire_StructWithComments_instance_method');
  late final _wire_StructWithComments_instance_method =
      _wire_StructWithComments_instance_methodPtr.asFunction<
          void Function(int, ffi.Pointer<wire_struct_with_comments>)>();

  void wire_StructWithComments_static_method(
    int port_,
  ) {
    return _wire_StructWithComments_static_method(
      port_,
    );
  }

  late final _wire_StructWithComments_static_methodPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_StructWithComments_static_method');
  late final _wire_StructWithComments_static_method =
      _wire_StructWithComments_static_methodPtr
          .asFunction<void Function(int)>();

  void wire_function_with_comments_slash_star_star(
    int port_,
  ) {
    return _wire_function_with_comments_slash_star_star(
      port_,
    );
  }

  late final _wire_function_with_comments_slash_star_starPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_function_with_comments_slash_star_star');
  late final _wire_function_with_comments_slash_star_star =
      _wire_function_with_comments_slash_star_starPtr
          .asFunction<void Function(int)>();

  void wire_function_with_comments_triple_slash_multi_line(
    int port_,
  ) {
    return _wire_function_with_comments_triple_slash_multi_line(
      port_,
    );
  }

  late final _wire_function_with_comments_triple_slash_multi_linePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_function_with_comments_triple_slash_multi_line');
  late final _wire_function_with_comments_triple_slash_multi_line =
      _wire_function_with_comments_triple_slash_multi_linePtr
          .asFunction<void Function(int)>();

  void wire_function_with_comments_triple_slash_single_line(
    int port_,
  ) {
    return _wire_function_with_comments_triple_slash_single_line(
      port_,
    );
  }

  late final _wire_function_with_comments_triple_slash_single_linePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_function_with_comments_triple_slash_single_line');
  late final _wire_function_with_comments_triple_slash_single_line =
      _wire_function_with_comments_triple_slash_single_linePtr
          .asFunction<void Function(int)>();

  void wire_example_primitive_type_bool(
    int port_,
    bool arg,
  ) {
    return _wire_example_primitive_type_bool(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_boolPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Bool)>>(
          'wire_example_primitive_type_bool');
  late final _wire_example_primitive_type_bool =
      _wire_example_primitive_type_boolPtr
          .asFunction<void Function(int, bool)>();

  void wire_example_primitive_type_f32(
    int port_,
    double arg,
  ) {
    return _wire_example_primitive_type_f32(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_f32Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Float)>>(
          'wire_example_primitive_type_f32');
  late final _wire_example_primitive_type_f32 =
      _wire_example_primitive_type_f32Ptr
          .asFunction<void Function(int, double)>();

  void wire_example_primitive_type_f64(
    int port_,
    double arg,
  ) {
    return _wire_example_primitive_type_f64(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_f64Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Double)>>(
          'wire_example_primitive_type_f64');
  late final _wire_example_primitive_type_f64 =
      _wire_example_primitive_type_f64Ptr
          .asFunction<void Function(int, double)>();

  void wire_example_primitive_type_i16(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_i16(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_i16Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int16)>>(
          'wire_example_primitive_type_i16');
  late final _wire_example_primitive_type_i16 =
      _wire_example_primitive_type_i16Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_i32(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_i32(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_i32Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>(
          'wire_example_primitive_type_i32');
  late final _wire_example_primitive_type_i32 =
      _wire_example_primitive_type_i32Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_i64(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_i64(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_i64Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int64)>>(
          'wire_example_primitive_type_i64');
  late final _wire_example_primitive_type_i64 =
      _wire_example_primitive_type_i64Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_i8(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_i8(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_i8Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int8)>>(
          'wire_example_primitive_type_i8');
  late final _wire_example_primitive_type_i8 =
      _wire_example_primitive_type_i8Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_u16(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_u16(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_u16Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Uint16)>>(
          'wire_example_primitive_type_u16');
  late final _wire_example_primitive_type_u16 =
      _wire_example_primitive_type_u16Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_u32(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_u32(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_u32Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Uint32)>>(
          'wire_example_primitive_type_u32');
  late final _wire_example_primitive_type_u32 =
      _wire_example_primitive_type_u32Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_u64(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_u64(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_u64Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Uint64)>>(
          'wire_example_primitive_type_u64');
  late final _wire_example_primitive_type_u64 =
      _wire_example_primitive_type_u64Ptr.asFunction<void Function(int, int)>();

  void wire_example_primitive_type_u8(
    int port_,
    int arg,
  ) {
    return _wire_example_primitive_type_u8(
      port_,
      arg,
    );
  }

  late final _wire_example_primitive_type_u8Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Uint8)>>(
          'wire_example_primitive_type_u8');
  late final _wire_example_primitive_type_u8 =
      _wire_example_primitive_type_u8Ptr.asFunction<void Function(int, int)>();

  void wire_simple_adder(
    int port_,
    int a,
    int b,
  ) {
    return _wire_simple_adder(
      port_,
      a,
      b,
    );
  }

  late final _wire_simple_adderPtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32, ffi.Int32)>>(
      'wire_simple_adder');
  late final _wire_simple_adder =
      _wire_simple_adderPtr.asFunction<void Function(int, int, int)>();

  WireSyncReturn wire_simple_adder_sync(
    int a,
    int b,
  ) {
    return _wire_simple_adder_sync(
      a,
      b,
    );
  }

  late final _wire_simple_adder_syncPtr = _lookup<
          ffi.NativeFunction<WireSyncReturn Function(ffi.Int32, ffi.Int32)>>(
      'wire_simple_adder_sync');
  late final _wire_simple_adder_sync = _wire_simple_adder_syncPtr
      .asFunction<WireSyncReturn Function(int, int)>();

  ffi.Pointer<wire_struct_with_comments>
      new_box_autoadd_struct_with_comments() {
    return _new_box_autoadd_struct_with_comments();
  }

  late final _new_box_autoadd_struct_with_commentsPtr = _lookup<
          ffi
          .NativeFunction<ffi.Pointer<wire_struct_with_comments> Function()>>(
      'new_box_autoadd_struct_with_comments');
  late final _new_box_autoadd_struct_with_comments =
      _new_box_autoadd_struct_with_commentsPtr
          .asFunction<ffi.Pointer<wire_struct_with_comments> Function()>();

  int dummy_method_to_enforce_bundling() {
    return _dummy_method_to_enforce_bundling();
  }

  late final _dummy_method_to_enforce_bundlingPtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>(
          'dummy_method_to_enforce_bundling');
  late final _dummy_method_to_enforce_bundling =
      _dummy_method_to_enforce_bundlingPtr.asFunction<int Function()>();
}

final class wire_struct_with_comments extends ffi.Struct {
  @ffi.Int32()
  external int field_with_comments;
}

// Section: api_fill_to_wire_funcs

void _api_fill_to_wire_box_autoadd_struct_with_comments(
    StructWithComments apiObj, ffi.Pointer<wire_struct_with_comments> wireObj) {
  _api_fill_to_wire_struct_with_comments(apiObj, wireObj.ref);
}

void _api_fill_to_wire_struct_with_comments(
    StructWithComments apiObj, wire_struct_with_comments wireObj) {
  wireObj.field_with_comments = api2wire_i_32(apiObj.fieldWithComments);
}
