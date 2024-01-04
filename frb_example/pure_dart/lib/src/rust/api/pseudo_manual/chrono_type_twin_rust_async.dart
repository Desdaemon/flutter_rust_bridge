// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.12.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<DateTime> datetimeUtcTwinRustAsync(
        {required DateTime d, dynamic hint}) =>
    RustLib.instance.api.datetimeUtcTwinRustAsync(d: d, hint: hint);

Future<DateTime> datetimeLocalTwinRustAsync(
        {required DateTime d, dynamic hint}) =>
    RustLib.instance.api.datetimeLocalTwinRustAsync(d: d, hint: hint);

Future<DateTime> naivedatetimeTwinRustAsync(
        {required DateTime d, dynamic hint}) =>
    RustLib.instance.api.naivedatetimeTwinRustAsync(d: d, hint: hint);

Future<DateTime?> optionalEmptyDatetimeUtcTwinRustAsync(
        {DateTime? d, dynamic hint}) =>
    RustLib.instance.api
        .optionalEmptyDatetimeUtcTwinRustAsync(d: d, hint: hint);

Future<Duration> durationTwinRustAsync({required Duration d, dynamic hint}) =>
    RustLib.instance.api.durationTwinRustAsync(d: d, hint: hint);

Future<List<Duration>> handleTimestampsTwinRustAsync(
        {required List<DateTime> timestamps,
        required DateTime epoch,
        dynamic hint}) =>
    RustLib.instance.api.handleTimestampsTwinRustAsync(
        timestamps: timestamps, epoch: epoch, hint: hint);

Future<List<DateTime>> handleDurationsTwinRustAsync(
        {required List<Duration> durations,
        required DateTime since,
        dynamic hint}) =>
    RustLib.instance.api.handleDurationsTwinRustAsync(
        durations: durations, since: since, hint: hint);

Future<TestChronoTwinRustAsync> testChronoTwinRustAsync({dynamic hint}) =>
    RustLib.instance.api.testChronoTwinRustAsync(hint: hint);

Future<TestChronoTwinRustAsync> testPreciseChronoTwinRustAsync(
        {dynamic hint}) =>
    RustLib.instance.api.testPreciseChronoTwinRustAsync(hint: hint);

Future<Duration> howLongDoesItTakeTwinRustAsync(
        {required FeatureChronoTwinRustAsync mine, dynamic hint}) =>
    RustLib.instance.api.howLongDoesItTakeTwinRustAsync(mine: mine, hint: hint);

class FeatureChronoTwinRustAsync {
  final DateTime utc;
  final DateTime local;
  final Duration duration;
  final DateTime naive;

  const FeatureChronoTwinRustAsync({
    required this.utc,
    required this.local,
    required this.duration,
    required this.naive,
  });

  @override
  int get hashCode =>
      utc.hashCode ^ local.hashCode ^ duration.hashCode ^ naive.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureChronoTwinRustAsync &&
          runtimeType == other.runtimeType &&
          utc == other.utc &&
          local == other.local &&
          duration == other.duration &&
          naive == other.naive;
}

class TestChronoTwinRustAsync {
  final DateTime? dt;
  final DateTime? dt2;
  final Duration? du;

  const TestChronoTwinRustAsync({
    this.dt,
    this.dt2,
    this.du,
  });

  @override
  int get hashCode => dt.hashCode ^ dt2.hashCode ^ du.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestChronoTwinRustAsync &&
          runtimeType == other.runtimeType &&
          dt == other.dt &&
          dt2 == other.dt2 &&
          du == other.du;
}
