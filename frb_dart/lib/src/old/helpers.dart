import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_rust_bridge/src/old/basic.dart';
import 'package:flutter_rust_bridge/src/old/platform_independent.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

export '../ffi.dart';

/// borrowed from flutter foundation [kIsWeb](https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html),
/// but allows for using it in a Dart context alike
const bool kIsWeb = identical(0, 0.0);

const uuidSizeInBytes = 16;

/// Allow custom setup hooks before ffi can be executed.
/// All other ffi calls will wait (async) until the setup ffi finishes.
///
/// Usage:
///
/// 1. Please call [setupMixinConstructor] inside the constructor of your class.
/// 2. Inside your [setup], please call ffi functions with hint=[kHintSetup].
mixin FlutterRustBridgeSetupMixin<T extends FlutterRustBridgeWireBase> on FlutterRustBridgeBase<T> {
  /// Inside your [setup], please call ffi functions with hint=[kHintSetup].
  static const kHintSetup = _FlutterRustBridgeSetupMixinSkipWaitHint._();

  final _setupCompleter = Completer<void>();

  /// Please call it inside the constructor of your class.
  void setupMixinConstructor() {
    () async {
      try {
        log('FlutterRustBridgeSetupMixin.setupMixinConstructor start setup');
        await setup();
      } finally {
        log('FlutterRustBridgeSetupMixin.setupMixinConstructor complete setup');
        _setupCompleter.complete();
      }
    }();
  }

  @override
  Future<S> executeNormal<S, E extends Object>(NormalTask<S, E> task) async {
    await _beforeExecute(task);
    return await super.executeNormal(task);
  }

  @override
  Stream<S> executeStream<S, E extends Object>(NormalTask<S, E> task) async* {
    await _beforeExecute(task);
    yield* super.executeStream(task);
  }

  Future<void> _beforeExecute<S, E extends Object>(NormalTask<S, E> task) async {
    if (!_setupCompleter.isCompleted && task.hint is! _FlutterRustBridgeSetupMixinSkipWaitHint) {
      log('FlutterRustBridgeSetupMixin.beforeExecute start waiting setup to complete (task=${task.debugName})');
      await _setupCompleter.future;
      log('FlutterRustBridgeSetupMixin.beforeExecute end waiting setup to complete (task=${task.debugName})');
    }
  }

  /// Do your setup logic inside this function.
  @protected
  Future<void> setup();

  /// Configure a logger for error handling.
  @protected
  void log(String message) {}
}

class _FlutterRustBridgeSetupMixinSkipWaitHint {
  const _FlutterRustBridgeSetupMixinSkipWaitHint._();
}

/// Add a timeout to [executeNormal]
mixin FlutterRustBridgeTimeoutMixin<T extends FlutterRustBridgeWireBase> on FlutterRustBridgeBase<T> {
  @override
  Future<S> executeNormal<S, E extends Object>(NormalTask<S, E> task) {
    // capture a stack trace at *here*, such that when timeout, can have a good stack trace
    final stackTrace = StackTrace.current;

    final timeLimitForExecuteNormal = this.timeLimitForExecuteNormal;

    var future = super.executeNormal(task);
    if (timeLimitForExecuteNormal != null) {
      future = future.timeout(timeLimitForExecuteNormal,
          onTimeout: () =>
              throw FlutterRustBridgeTimeoutException(timeLimitForExecuteNormal, task.debugName, stackTrace));
    }

    return future;
  }

  /// The time limit for methods using [executeNormal]. Return null means *disable* this functionality.
  @protected
  Duration? get timeLimitForExecuteNormal;
}

List<T?> mapNonNull<T, I>(List<I?> items, T Function(I) mapper) {
  final out = List<T?>.filled(items.length, null);
  for (var i = 0; i < items.length; ++i) {
    final item = items[i];
    if (item != null) out[i] = mapper(item);
  }
  return out;
}
