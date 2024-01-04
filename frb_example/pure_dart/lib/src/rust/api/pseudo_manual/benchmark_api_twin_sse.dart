// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<void> benchmarkVoidTwinSse({dynamic hint}) =>
    RustLib.instance.api.benchmarkVoidTwinSse(hint: hint);

Future<int> benchmarkInputBytesTwinSse(
        {required List<int> bytes, dynamic hint}) =>
    RustLib.instance.api.benchmarkInputBytesTwinSse(bytes: bytes, hint: hint);

Future<Uint8List> benchmarkOutputBytesTwinSse(
        {required int size, dynamic hint}) =>
    RustLib.instance.api.benchmarkOutputBytesTwinSse(size: size, hint: hint);

Future<void> benchmarkBinaryTreeInputTwinSse(
        {required BenchmarkBinaryTreeTwinSse tree, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBinaryTreeInputTwinSse(tree: tree, hint: hint);

Future<BenchmarkBinaryTreeTwinSse> benchmarkBinaryTreeOutputTwinSse(
        {required int depth, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBinaryTreeOutputTwinSse(depth: depth, hint: hint);

Future<void> benchmarkBinaryTreeInputProtobufTwinSse(
        {required List<int> raw, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBinaryTreeInputProtobufTwinSse(raw: raw, hint: hint);

Future<Uint8List> benchmarkBinaryTreeOutputProtobufTwinSse(
        {required int depth, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBinaryTreeOutputProtobufTwinSse(depth: depth, hint: hint);

Future<void> benchmarkBinaryTreeInputJsonTwinSse(
        {required String raw, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBinaryTreeInputJsonTwinSse(raw: raw, hint: hint);

Future<String> benchmarkBinaryTreeOutputJsonTwinSse(
        {required int depth, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBinaryTreeOutputJsonTwinSse(depth: depth, hint: hint);

Future<void> benchmarkBlobInputTwinSse(
        {required BenchmarkBlobTwinSse blob, dynamic hint}) =>
    RustLib.instance.api.benchmarkBlobInputTwinSse(blob: blob, hint: hint);

Future<BenchmarkBlobTwinSse> benchmarkBlobOutputTwinSse(
        {required int size, dynamic hint}) =>
    RustLib.instance.api.benchmarkBlobOutputTwinSse(size: size, hint: hint);

Future<void> benchmarkBlobInputProtobufTwinSse(
        {required List<int> raw, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBlobInputProtobufTwinSse(raw: raw, hint: hint);

Future<Uint8List> benchmarkBlobOutputProtobufTwinSse(
        {required int size, dynamic hint}) =>
    RustLib.instance.api
        .benchmarkBlobOutputProtobufTwinSse(size: size, hint: hint);

Future<void> benchmarkBlobInputJsonTwinSse(
        {required String raw, dynamic hint}) =>
    RustLib.instance.api.benchmarkBlobInputJsonTwinSse(raw: raw, hint: hint);

Future<String> benchmarkBlobOutputJsonTwinSse(
        {required int size, dynamic hint}) =>
    RustLib.instance.api.benchmarkBlobOutputJsonTwinSse(size: size, hint: hint);

class BenchmarkBinaryTreeTwinSse {
  final String name;
  final BenchmarkBinaryTreeTwinSse? left;
  final BenchmarkBinaryTreeTwinSse? right;

  const BenchmarkBinaryTreeTwinSse({
    required this.name,
    this.left,
    this.right,
  });

  @override
  int get hashCode => name.hashCode ^ left.hashCode ^ right.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BenchmarkBinaryTreeTwinSse &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          left == other.left &&
          right == other.right;
}

class BenchmarkBlobTwinSse {
  final Uint8List first;
  final Uint8List second;
  final Uint8List third;

  const BenchmarkBlobTwinSse({
    required this.first,
    required this.second,
    required this.third,
  });

  @override
  int get hashCode => first.hashCode ^ second.hashCode ^ third.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BenchmarkBlobTwinSse &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second &&
          third == other.third;
}
