// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.30.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// The type `ComplexEnumWithCommentsTwinRustAsync` is not used by any `pub` functions, thus it is ignored.
// The type `SimpleEnumWithCommentsTwinRustAsync` is not used by any `pub` functions, thus it is ignored.

/// This is single line comment
Future<void> functionWithCommentsTripleSlashSingleLineTwinRustAsync(
        {dynamic hint}) =>
    RustLib.instance.api
        .functionWithCommentsTripleSlashSingleLineTwinRustAsync(hint: hint);

/// This is first line
/// This is second line
Future<void> functionWithCommentsTripleSlashMultiLineTwinRustAsync(
        {dynamic hint}) =>
    RustLib.instance.api
        .functionWithCommentsTripleSlashMultiLineTwinRustAsync(hint: hint);

/// Multiline comments are fine,
/// but they are not preferred in Rust nor in Dart.
/// Newlines are preserved.
Future<void> functionWithCommentsSlashStarStarTwinRustAsync({dynamic hint}) =>
    RustLib.instance.api
        .functionWithCommentsSlashStarStarTwinRustAsync(hint: hint);

/// Comments on structs
class StructWithCommentsTwinRustAsync {
  /// Documentation on a struct field
  final int fieldWithComments;

  const StructWithCommentsTwinRustAsync({
    required this.fieldWithComments,
  });

  /// Documentation on an instance method
  Future<void> instanceMethodTwinRustAsync({dynamic hint}) =>
      RustLib.instance.api
          .structWithCommentsTwinRustAsyncInstanceMethodTwinRustAsync(
              that: this, hint: hint);

  /// Documentation on a static method
  static Future<void> staticMethodTwinRustAsync({dynamic hint}) =>
      RustLib.instance.api
          .structWithCommentsTwinRustAsyncStaticMethodTwinRustAsync(hint: hint);

  @override
  int get hashCode => fieldWithComments.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructWithCommentsTwinRustAsync &&
          runtimeType == other.runtimeType &&
          fieldWithComments == other.fieldWithComments;
}