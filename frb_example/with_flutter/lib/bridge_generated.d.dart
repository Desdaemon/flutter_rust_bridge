// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes

import 'dart:convert';
import 'dart:typed_data';

abstract class FlutterRustBridgeExample {
  Future<Uint8List> drawMandelbrot(
      {required Size imageSize,
      required Point zoomPoint,
      required double scale,
      required int numThreads,
      dynamic hint});

  Future<String> passingComplexStructs({required TreeNode root, dynamic hint});

  Future<int> offTopicMemoryTestInputArray({required Uint8List input, dynamic hint});

  Future<Uint8List> offTopicMemoryTestOutputZeroCopyBuffer({required int len, dynamic hint});

  Future<Uint8List> offTopicMemoryTestOutputVecU8({required int len, dynamic hint});

  Future<int> offTopicMemoryTestInputVecOfObject({required List<Size> input, dynamic hint});

  Future<List<Size>> offTopicMemoryTestOutputVecOfObject({required int len, dynamic hint});

  Future<int> offTopicMemoryTestInputComplexStruct({required TreeNode input, dynamic hint});

  Future<TreeNode> offTopicMemoryTestOutputComplexStruct({required int len, dynamic hint});

  Future<int> offTopicDeliberatelyReturnError({dynamic hint});

  Future<int> offTopicDeliberatelyPanic({dynamic hint});
}

class Point {
  final double x;
  final double y;

  Point({
    required this.x,
    required this.y,
  });
}

class Size {
  final int width;
  final int height;

  Size({
    required this.width,
    required this.height,
  });
}

class TreeNode {
  final String name;
  final List<TreeNode> children;

  TreeNode({
    required this.name,
    required this.children,
  });
}
