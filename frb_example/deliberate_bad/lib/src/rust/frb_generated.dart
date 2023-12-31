// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.9.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.io.dart' if (dart.library.html) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'frb_example_deliberate_bad',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<void> makeDataRace({dynamic hint});

  Future<void> makeHeapUseAfterFree({dynamic hint});

  Future<void> makeMemoryLeak({dynamic hint});

  Future<void> makeStackBufferOverflow({dynamic hint});

  Future<void> makeUseOfUninitializedValue({dynamic hint});
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<void> makeDataRace({dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        return wire.wire_make_data_race(port_);
      },
      codec: DcoCodec(
        decodeSuccessData: dco_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kMakeDataRaceConstMeta,
      argValues: [],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kMakeDataRaceConstMeta => const TaskConstMeta(
        debugName: "make_data_race",
        argNames: [],
      );

  @override
  Future<void> makeHeapUseAfterFree({dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        return wire.wire_make_heap_use_after_free(port_);
      },
      codec: DcoCodec(
        decodeSuccessData: dco_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kMakeHeapUseAfterFreeConstMeta,
      argValues: [],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kMakeHeapUseAfterFreeConstMeta => const TaskConstMeta(
        debugName: "make_heap_use_after_free",
        argNames: [],
      );

  @override
  Future<void> makeMemoryLeak({dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        return wire.wire_make_memory_leak(port_);
      },
      codec: DcoCodec(
        decodeSuccessData: dco_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kMakeMemoryLeakConstMeta,
      argValues: [],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kMakeMemoryLeakConstMeta => const TaskConstMeta(
        debugName: "make_memory_leak",
        argNames: [],
      );

  @override
  Future<void> makeStackBufferOverflow({dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        return wire.wire_make_stack_buffer_overflow(port_);
      },
      codec: DcoCodec(
        decodeSuccessData: dco_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kMakeStackBufferOverflowConstMeta,
      argValues: [],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kMakeStackBufferOverflowConstMeta => const TaskConstMeta(
        debugName: "make_stack_buffer_overflow",
        argNames: [],
      );

  @override
  Future<void> makeUseOfUninitializedValue({dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        return wire.wire_make_use_of_uninitialized_value(port_);
      },
      codec: DcoCodec(
        decodeSuccessData: dco_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kMakeUseOfUninitializedValueConstMeta,
      argValues: [],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kMakeUseOfUninitializedValueConstMeta =>
      const TaskConstMeta(
        debugName: "make_use_of_uninitialized_value",
        argNames: [],
      );

  @protected
  void dco_decode_unit(dynamic raw) {
    return;
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {}

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    return deserializer.buffer.getInt32();
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  void cst_encode_unit(void raw) {
    return raw;
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {}

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    serializer.buffer.putUint8(self ? 1 : 0);
  }
}
