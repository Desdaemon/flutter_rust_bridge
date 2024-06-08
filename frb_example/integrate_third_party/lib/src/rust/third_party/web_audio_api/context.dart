// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.37.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../api/override_web_audio_api.dart';
import '../../frb_generated.dart';
import '../web_audio_api.dart';
import 'media_streams.dart';
import 'node.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'context.freezed.dart';

// These functions are ignored because they have generic arguments: `decode_audio_data_sync`, `decode_audio_data_sync`, `decode_audio_data_sync`, `set_onstatechange`, `set_onstatechange`, `set_onstatechange`, `set_onstatechange`
// These types are ignored because they are not used by any `pub` functions: `AudioNodeId`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AudioContext>>
abstract class AudioContext
    implements RustOpaqueInterface, AudioContextExt, BaseAudioContext {
  /// Returns the [`BaseAudioContext`] concrete type associated with this `AudioContext`
  Future<void> base();

  /// This represents the number of seconds of processing latency incurred by
  /// the `AudioContext` passing the audio from the `AudioDestinationNode`
  /// to the audio subsystem.
  Future<double> baseLatency();

  /// Unset the callback to run when the audio sink has changed
  Future<void> clearOnsinkchange();

  /// Unset the callback to run when the state of the AudioContext has changed
  Future<void> clearOnstatechange();

  /// Closes the `AudioContext`, releasing the system resources being used.
  ///
  /// This will not automatically release all `AudioContext`-created objects, but will suspend
  /// the progression of the currentTime, and stop processing audio data.
  ///
  /// # Panics
  ///
  /// Will panic when this function is called multiple times
  Future<void> close();

  /// Closes the `AudioContext`, releasing the system resources being used.
  ///
  /// This will not automatically release all `AudioContext`-created objects, but will suspend
  /// the progression of the currentTime, and stop processing audio data.
  ///
  /// This function operates synchronously and blocks the current thread until the audio thread
  /// has stopped processing.
  ///
  /// # Panics
  ///
  /// Will panic when this function is called multiple times
  Future<void> closeSync();

  /// Creates a `AnalyserNode`
  Future<AnalyserNode> createAnalyser();

  /// Create an `AudioParam`.
  ///
  /// Call this inside the `register` closure when setting up your `AudioNode`
  Future<(AudioParam, AudioParamId)> createAudioParam(
      {required AudioParamDescriptor opts,
      required AudioContextRegistration dest});

  /// Creates an `BiquadFilterNode` which implements a second order filter
  Future<BiquadFilterNode> createBiquadFilter();

  /// Create an new "in-memory" `AudioBuffer` with the given number of channels,
  /// length (i.e. number of samples per channel) and sample rate.
  ///
  /// Note: In most cases you will want the sample rate to match the current
  /// audio context sample rate.
  Future<AudioBuffer> createBuffer(
      {required BigInt numberOfChannels,
      required BigInt length,
      required double sampleRate});

  /// Creates an `AudioBufferSourceNode`
  Future<AudioBufferSourceNode> createBufferSource();

  /// Creates a `ChannelMergerNode`
  Future<ChannelMergerNode> createChannelMerger(
      {required BigInt numberOfInputs});

  /// Creates a `ChannelSplitterNode`
  Future<ChannelSplitterNode> createChannelSplitter(
      {required BigInt numberOfOutputs});

  /// Creates an `ConstantSourceNode`, a source representing a constant value
  Future<ConstantSourceNode> createConstantSource();

  /// Creates an `ConvolverNode`, a processing node which applies linear convolution
  Future<ConvolverNode> createConvolver();

  /// Creates a `DelayNode`, delaying the audio signal
  Future<DelayNode> createDelay({required double maxDelayTime});

  /// Creates a `DynamicsCompressorNode`, compressing the audio signal
  Future<DynamicsCompressorNode> createDynamicsCompressor();

  /// Creates an `GainNode`, to control audio volume
  Future<GainNode> createGain();

  /// Creates an `IirFilterNode`
  ///
  /// # Arguments
  ///
  /// * `feedforward` - An array of the feedforward (numerator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  /// * `feedback` - An array of the feedback (denominator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  Future<IirFilterNode> createIirFilter(
      {required List<double> feedforward, required List<double> feedback});

  /// Creates a [`MediaStreamAudioDestinationNode`](node::MediaStreamAudioDestinationNode)
  Future<MediaStreamAudioDestinationNode> createMediaStreamDestination();

  /// Creates a [`MediaStreamAudioSourceNode`](node::MediaStreamAudioSourceNode) from a
  /// [`MediaStream`]
  Future<MediaStreamAudioSourceNode> createMediaStreamSource(
      {required MediaStream media});

  /// Creates a [`MediaStreamTrackAudioSourceNode`](node::MediaStreamTrackAudioSourceNode) from a
  /// [`MediaStreamTrack`]
  Future<MediaStreamTrackAudioSourceNode> createMediaStreamTrackSource(
      {required MediaStreamTrack media});

  /// Creates an `OscillatorNode`, a source representing a periodic waveform.
  Future<OscillatorNode> createOscillator();

  /// Creates a `PannerNode`
  Future<PannerNode> createPanner();

  /// Creates a periodic wave
  ///
  /// Please note that this constructor deviates slightly from the spec by requiring a single
  /// argument with the periodic wave options.
  Future<PeriodicWave> createPeriodicWave(
      {required PeriodicWaveOptions options});

  /// Creates an `ScriptProcessorNode` for custom audio processing (deprecated);
  ///
  /// # Panics
  ///
  /// This function panics if:
  /// - `buffer_size` is not 256, 512, 1024, 2048, 4096, 8192, or 16384
  /// - the number of input and output channels are both zero
  /// - either of the channel counts exceed [`crate::MAX_CHANNELS`]
  Future<ScriptProcessorNode> createScriptProcessor(
      {required BigInt bufferSize,
      required BigInt numberOfInputChannels,
      required BigInt numberOfOutputChannels});

  /// Creates an `StereoPannerNode` to pan a stereo output
  Future<StereoPannerNode> createStereoPanner();

  /// Creates a `WaveShaperNode`
  Future<WaveShaperNode> createWaveShaper();

  /// This is the time in seconds of the sample frame immediately following the last sample-frame
  /// in the block of audio most recently processed by the context’s rendering graph.
  Future<double> currentTime();

  /// Returns an `AudioDestinationNode` representing the final destination of all audio in the
  /// context. It can be thought of as the audio-rendering device.
  Future<AudioDestinationNode> destination();

  Future<AudioBuffer> decodeAudioDataSync({required String inputPath});

  /// Returns the `AudioListener` which is used for 3D spatialization
  Future<AudioListener> listener();

  /// Creates and returns a new `AudioContext` object.
  ///
  /// This will play live audio on the default output device.
  ///
  /// ```no_run
  /// use web_audio_api::context::{AudioContext, AudioContextOptions};
  ///
  /// // Request a sample rate of 44.1 kHz and default latency (buffer size 128, if available)
  /// let opts = AudioContextOptions {
  ///     sample_rate: Some(44100.),
  ///     ..AudioContextOptions::default()
  /// };
  ///
  /// // Setup the audio context that will emit to your speakers
  /// let context = AudioContext::new(opts);
  ///
  /// // Alternatively, use the default constructor to get the best settings for your hardware
  /// // let context = AudioContext::default();
  /// ```
  ///
  /// # Panics
  ///
  /// The `AudioContext` constructor will panic when an invalid `sinkId` is provided in the
  /// `AudioContextOptions`. In a future version, a `try_new` constructor will be introduced that
  /// never panics.
  factory AudioContext({required AudioContextOptions options}) =>
      RustLib.instance.api.webAudioApiContextAudioContextNew(options: options);

  /// The estimation in seconds of audio output latency, i.e., the interval
  /// between the time the UA requests the host system to play a buffer and
  /// the time at which the first sample in the buffer is actually processed
  /// by the audio output device.
  Future<double> outputLatency();

  /// Returns an [`AudioRenderCapacity`] instance associated with an AudioContext.
  Future<void> renderCapacity();

  /// Resumes the progression of time in an audio context that has previously been
  /// suspended/paused.
  ///
  /// This function operates synchronously and blocks the current thread until the audio thread
  /// has started processing again.
  ///
  /// # Panics
  ///
  /// Will panic if:
  ///
  /// * The audio device is not available
  /// * For a `BackendSpecificError`
  Future<void> resumeSync();

  /// The sample rate (in sample-frames per second) at which the `AudioContext` handles audio.
  Future<double> sampleRate();

  /// Identifier or the information of the current audio output device.
  ///
  /// The initial value is `""`, which means the default audio output device.
  Future<String> sinkId();

  /// Returns state of current context
  Future<AudioContextState> state();

  /// Suspends the progression of time in the audio context.
  ///
  /// This will temporarily halt audio hardware access and reducing CPU/battery usage in the
  /// process.
  ///
  /// # Panics
  ///
  /// Will panic if:
  ///
  /// * The audio device is not available
  /// * For a `BackendSpecificError`
  Future<void> suspend();

  /// Suspends the progression of time in the audio context.
  ///
  /// This will temporarily halt audio hardware access and reducing CPU/battery usage in the
  /// process.
  ///
  /// This function operates synchronously and blocks the current thread until the audio thread
  /// has stopped processing.
  ///
  /// # Panics
  ///
  /// Will panic if:
  ///
  /// * The audio device is not available
  /// * For a `BackendSpecificError`
  Future<void> suspendSync();
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AudioContextRegistration>>
abstract class AudioContextRegistration implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AudioParamId>>
abstract class AudioParamId implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<ConcreteBaseAudioContext>>
abstract class ConcreteBaseAudioContext
    implements RustOpaqueInterface, BaseAudioContext {
  /// Returns the [`BaseAudioContext`] concrete type associated with this `AudioContext`
  Future<void> base();

  /// Unset the callback to run when the state of the AudioContext has changed
  Future<void> clearOnstatechange();

  /// Creates a `AnalyserNode`
  Future<AnalyserNode> createAnalyser();

  /// Create an `AudioParam`.
  ///
  /// Call this inside the `register` closure when setting up your `AudioNode`
  Future<(AudioParam, AudioParamId)> createAudioParam(
      {required AudioParamDescriptor opts,
      required AudioContextRegistration dest});

  /// Creates an `BiquadFilterNode` which implements a second order filter
  Future<BiquadFilterNode> createBiquadFilter();

  /// Create an new "in-memory" `AudioBuffer` with the given number of channels,
  /// length (i.e. number of samples per channel) and sample rate.
  ///
  /// Note: In most cases you will want the sample rate to match the current
  /// audio context sample rate.
  Future<AudioBuffer> createBuffer(
      {required BigInt numberOfChannels,
      required BigInt length,
      required double sampleRate});

  /// Creates an `AudioBufferSourceNode`
  Future<AudioBufferSourceNode> createBufferSource();

  /// Creates a `ChannelMergerNode`
  Future<ChannelMergerNode> createChannelMerger(
      {required BigInt numberOfInputs});

  /// Creates a `ChannelSplitterNode`
  Future<ChannelSplitterNode> createChannelSplitter(
      {required BigInt numberOfOutputs});

  /// Creates an `ConstantSourceNode`, a source representing a constant value
  Future<ConstantSourceNode> createConstantSource();

  /// Creates an `ConvolverNode`, a processing node which applies linear convolution
  Future<ConvolverNode> createConvolver();

  /// Creates a `DelayNode`, delaying the audio signal
  Future<DelayNode> createDelay({required double maxDelayTime});

  /// Creates a `DynamicsCompressorNode`, compressing the audio signal
  Future<DynamicsCompressorNode> createDynamicsCompressor();

  /// Creates an `GainNode`, to control audio volume
  Future<GainNode> createGain();

  /// Creates an `IirFilterNode`
  ///
  /// # Arguments
  ///
  /// * `feedforward` - An array of the feedforward (numerator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  /// * `feedback` - An array of the feedback (denominator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  Future<IirFilterNode> createIirFilter(
      {required List<double> feedforward, required List<double> feedback});

  /// Creates an `OscillatorNode`, a source representing a periodic waveform.
  Future<OscillatorNode> createOscillator();

  /// Creates a `PannerNode`
  Future<PannerNode> createPanner();

  /// Creates a periodic wave
  ///
  /// Please note that this constructor deviates slightly from the spec by requiring a single
  /// argument with the periodic wave options.
  Future<PeriodicWave> createPeriodicWave(
      {required PeriodicWaveOptions options});

  /// Creates an `ScriptProcessorNode` for custom audio processing (deprecated);
  ///
  /// # Panics
  ///
  /// This function panics if:
  /// - `buffer_size` is not 256, 512, 1024, 2048, 4096, 8192, or 16384
  /// - the number of input and output channels are both zero
  /// - either of the channel counts exceed [`crate::MAX_CHANNELS`]
  Future<ScriptProcessorNode> createScriptProcessor(
      {required BigInt bufferSize,
      required BigInt numberOfInputChannels,
      required BigInt numberOfOutputChannels});

  /// Creates an `StereoPannerNode` to pan a stereo output
  Future<StereoPannerNode> createStereoPanner();

  /// Creates a `WaveShaperNode`
  Future<WaveShaperNode> createWaveShaper();

  /// This is the time in seconds of the sample frame immediately following the last sample-frame
  /// in the block of audio most recently processed by the context’s rendering graph.
  Future<double> currentTime();

  /// Returns an `AudioDestinationNode` representing the final destination of all audio in the
  /// context. It can be thought of as the audio-rendering device.
  Future<AudioDestinationNode> destination();

  /// Returns the `AudioListener` which is used for 3D spatialization
  Future<AudioListener> listener();

  /// Inform render thread that this node can act as a cycle breaker
  Future<void> markCycleBreaker({required AudioContextRegistration reg});

  /// The sample rate (in sample-frames per second) at which the `AudioContext` handles audio.
  Future<double> sampleRate();

  /// Returns state of current context
  Future<AudioContextState> state();
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<OfflineAudioContext>>
abstract class OfflineAudioContext
    implements RustOpaqueInterface, BaseAudioContext {
  /// Returns the [`BaseAudioContext`] concrete type associated with this `AudioContext`
  Future<void> base();

  /// Unset the callback to run when the rendering has completed
  Future<void> clearOncomplete();

  /// Unset the callback to run when the state of the AudioContext has changed
  Future<void> clearOnstatechange();

  /// Creates a `AnalyserNode`
  Future<AnalyserNode> createAnalyser();

  /// Create an `AudioParam`.
  ///
  /// Call this inside the `register` closure when setting up your `AudioNode`
  Future<(AudioParam, AudioParamId)> createAudioParam(
      {required AudioParamDescriptor opts,
      required AudioContextRegistration dest});

  /// Creates an `BiquadFilterNode` which implements a second order filter
  Future<BiquadFilterNode> createBiquadFilter();

  /// Create an new "in-memory" `AudioBuffer` with the given number of channels,
  /// length (i.e. number of samples per channel) and sample rate.
  ///
  /// Note: In most cases you will want the sample rate to match the current
  /// audio context sample rate.
  Future<AudioBuffer> createBuffer(
      {required BigInt numberOfChannels,
      required BigInt length,
      required double sampleRate});

  /// Creates an `AudioBufferSourceNode`
  Future<AudioBufferSourceNode> createBufferSource();

  /// Creates a `ChannelMergerNode`
  Future<ChannelMergerNode> createChannelMerger(
      {required BigInt numberOfInputs});

  /// Creates a `ChannelSplitterNode`
  Future<ChannelSplitterNode> createChannelSplitter(
      {required BigInt numberOfOutputs});

  /// Creates an `ConstantSourceNode`, a source representing a constant value
  Future<ConstantSourceNode> createConstantSource();

  /// Creates an `ConvolverNode`, a processing node which applies linear convolution
  Future<ConvolverNode> createConvolver();

  /// Creates a `DelayNode`, delaying the audio signal
  Future<DelayNode> createDelay({required double maxDelayTime});

  /// Creates a `DynamicsCompressorNode`, compressing the audio signal
  Future<DynamicsCompressorNode> createDynamicsCompressor();

  /// Creates an `GainNode`, to control audio volume
  Future<GainNode> createGain();

  /// Creates an `IirFilterNode`
  ///
  /// # Arguments
  ///
  /// * `feedforward` - An array of the feedforward (numerator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  /// * `feedback` - An array of the feedback (denominator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  Future<IirFilterNode> createIirFilter(
      {required List<double> feedforward, required List<double> feedback});

  /// Creates an `OscillatorNode`, a source representing a periodic waveform.
  Future<OscillatorNode> createOscillator();

  /// Creates a `PannerNode`
  Future<PannerNode> createPanner();

  /// Creates a periodic wave
  ///
  /// Please note that this constructor deviates slightly from the spec by requiring a single
  /// argument with the periodic wave options.
  Future<PeriodicWave> createPeriodicWave(
      {required PeriodicWaveOptions options});

  /// Creates an `ScriptProcessorNode` for custom audio processing (deprecated);
  ///
  /// # Panics
  ///
  /// This function panics if:
  /// - `buffer_size` is not 256, 512, 1024, 2048, 4096, 8192, or 16384
  /// - the number of input and output channels are both zero
  /// - either of the channel counts exceed [`crate::MAX_CHANNELS`]
  Future<ScriptProcessorNode> createScriptProcessor(
      {required BigInt bufferSize,
      required BigInt numberOfInputChannels,
      required BigInt numberOfOutputChannels});

  /// Creates an `StereoPannerNode` to pan a stereo output
  Future<StereoPannerNode> createStereoPanner();

  /// Creates a `WaveShaperNode`
  Future<WaveShaperNode> createWaveShaper();

  /// This is the time in seconds of the sample frame immediately following the last sample-frame
  /// in the block of audio most recently processed by the context’s rendering graph.
  Future<double> currentTime();

  /// Returns an `AudioDestinationNode` representing the final destination of all audio in the
  /// context. It can be thought of as the audio-rendering device.
  Future<AudioDestinationNode> destination();

  /// get the length of rendering audio buffer
  Future<BigInt> length();

  /// Returns the `AudioListener` which is used for 3D spatialization
  Future<AudioListener> listener();

  // HINT: Make it `#[frb(sync)]` to let it become the default constructor of Dart class.
  /// Creates an `OfflineAudioContext` instance
  ///
  /// # Arguments
  ///
  /// * `channels` - number of output channels to render
  /// * `length` - length of the rendering audio buffer
  /// * `sample_rate` - output sample rate
  static Future<OfflineAudioContext> newInstance(
          {required BigInt numberOfChannels,
          required BigInt length,
          required double sampleRate}) =>
      RustLib.instance.api.webAudioApiContextOfflineAudioContextNew(
          numberOfChannels: numberOfChannels,
          length: length,
          sampleRate: sampleRate);

  /// Resumes the progression of the OfflineAudioContext's currentTime when it has been suspended
  ///
  /// # Panics
  ///
  /// Panics when the context is closed or rendering has not started
  Future<void> resume();

  /// The sample rate (in sample-frames per second) at which the `AudioContext` handles audio.
  Future<double> sampleRate();

  /// Given the current connections and scheduled changes, starts rendering audio.
  ///
  /// Rendering is purely CPU bound and contains no `await` points, so calling this method will
  /// block the executor until completion or until the context is suspended.
  ///
  /// This method will only adhere to scheduled suspensions via [`Self::suspend`] and will
  /// ignore those provided via [`Self::suspend_sync`].
  ///
  /// # Panics
  ///
  /// Panics if this method is called multiple times.
  Future<AudioBuffer> startRendering();

  /// Given the current connections and scheduled changes, starts rendering audio.
  ///
  /// This function will block the current thread and returns the rendered `AudioBuffer`
  /// synchronously.
  ///
  /// This method will only adhere to scheduled suspensions via [`Self::suspend_sync`] and
  /// will ignore those provided via [`Self::suspend`].
  ///
  /// # Panics
  ///
  /// Panics if this method is called multiple times
  Future<AudioBuffer> startRenderingSync();

  /// Returns state of current context
  Future<AudioContextState> state();

  /// Schedules a suspension of the time progression in the audio context at the specified time
  /// and returns a promise
  ///
  /// The specified time is quantized and rounded up to the render quantum size.
  ///
  /// # Panics
  ///
  /// Panics if the quantized frame number
  ///
  /// - is negative or
  /// - is less than or equal to the current time or
  /// - is greater than or equal to the total render duration or
  /// - is scheduled by another suspend for the same time
  ///
  /// # Example usage
  ///
  /// ```rust
  /// use futures::{executor, join};
  /// use futures::FutureExt as _;
  /// use std::sync::Arc;
  ///
  /// use web_audio_api::context::BaseAudioContext;
  /// use web_audio_api::context::OfflineAudioContext;
  /// use web_audio_api::node::{AudioNode, AudioScheduledSourceNode};
  ///
  /// let context = Arc::new(OfflineAudioContext::new(1, 512, 44_100.));
  /// let context_clone = Arc::clone(&context);
  ///
  /// let suspend_promise = context.suspend(128. / 44_100.).then(|_| async move {
  ///     let mut src = context_clone.create_constant_source();
  ///     src.connect(&context_clone.destination());
  ///     src.start();
  ///     context_clone.resume().await;
  /// });
  ///
  /// let render_promise = context.start_rendering();
  ///
  /// let buffer = executor::block_on(async move { join!(suspend_promise, render_promise).1 });
  /// assert_eq!(buffer.number_of_channels(), 1);
  /// assert_eq!(buffer.length(), 512);
  /// ```
  Future<void> suspend({required double suspendTime});
}

abstract class BaseAudioContext {
  /// Returns the [`BaseAudioContext`] concrete type associated with this `AudioContext`
  Future<void> base();

  /// Unset the callback to run when the state of the AudioContext has changed
  Future<void> clearOnstatechange();

  /// Creates a `AnalyserNode`
  Future<AnalyserNode> createAnalyser();

  /// Create an `AudioParam`.
  ///
  /// Call this inside the `register` closure when setting up your `AudioNode`
  Future<(AudioParam, AudioParamId)> createAudioParam(
      {required AudioParamDescriptor opts,
      required AudioContextRegistration dest});

  /// Creates an `BiquadFilterNode` which implements a second order filter
  Future<BiquadFilterNode> createBiquadFilter();

  /// Create an new "in-memory" `AudioBuffer` with the given number of channels,
  /// length (i.e. number of samples per channel) and sample rate.
  ///
  /// Note: In most cases you will want the sample rate to match the current
  /// audio context sample rate.
  Future<AudioBuffer> createBuffer(
      {required BigInt numberOfChannels,
      required BigInt length,
      required double sampleRate});

  /// Creates an `AudioBufferSourceNode`
  Future<AudioBufferSourceNode> createBufferSource();

  /// Creates a `ChannelMergerNode`
  Future<ChannelMergerNode> createChannelMerger(
      {required BigInt numberOfInputs});

  /// Creates a `ChannelSplitterNode`
  Future<ChannelSplitterNode> createChannelSplitter(
      {required BigInt numberOfOutputs});

  /// Creates an `ConstantSourceNode`, a source representing a constant value
  Future<ConstantSourceNode> createConstantSource();

  /// Creates an `ConvolverNode`, a processing node which applies linear convolution
  Future<ConvolverNode> createConvolver();

  /// Creates a `DelayNode`, delaying the audio signal
  Future<DelayNode> createDelay({required double maxDelayTime});

  /// Creates a `DynamicsCompressorNode`, compressing the audio signal
  Future<DynamicsCompressorNode> createDynamicsCompressor();

  /// Creates an `GainNode`, to control audio volume
  Future<GainNode> createGain();

  /// Creates an `IirFilterNode`
  ///
  /// # Arguments
  ///
  /// * `feedforward` - An array of the feedforward (numerator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  /// * `feedback` - An array of the feedback (denominator) coefficients for the transfer function of the IIR filter.
  /// The maximum length of this array is 20
  Future<IirFilterNode> createIirFilter(
      {required List<double> feedforward, required List<double> feedback});

  /// Creates an `OscillatorNode`, a source representing a periodic waveform.
  Future<OscillatorNode> createOscillator();

  /// Creates a `PannerNode`
  Future<PannerNode> createPanner();

  /// Creates a periodic wave
  ///
  /// Please note that this constructor deviates slightly from the spec by requiring a single
  /// argument with the periodic wave options.
  Future<PeriodicWave> createPeriodicWave(
      {required PeriodicWaveOptions options});

  /// Creates an `ScriptProcessorNode` for custom audio processing (deprecated);
  ///
  /// # Panics
  ///
  /// This function panics if:
  /// - `buffer_size` is not 256, 512, 1024, 2048, 4096, 8192, or 16384
  /// - the number of input and output channels are both zero
  /// - either of the channel counts exceed [`crate::MAX_CHANNELS`]
  Future<ScriptProcessorNode> createScriptProcessor(
      {required BigInt bufferSize,
      required BigInt numberOfInputChannels,
      required BigInt numberOfOutputChannels});

  /// Creates an `StereoPannerNode` to pan a stereo output
  Future<StereoPannerNode> createStereoPanner();

  /// Creates a `WaveShaperNode`
  Future<WaveShaperNode> createWaveShaper();

  /// This is the time in seconds of the sample frame immediately following the last sample-frame
  /// in the block of audio most recently processed by the context’s rendering graph.
  Future<double> currentTime();

  /// Returns an `AudioDestinationNode` representing the final destination of all audio in the
  /// context. It can be thought of as the audio-rendering device.
  Future<AudioDestinationNode> destination();

  /// Returns the `AudioListener` which is used for 3D spatialization
  Future<AudioListener> listener();

  /// The sample rate (in sample-frames per second) at which the `AudioContext` handles audio.
  Future<double> sampleRate();

  /// Returns state of current context
  Future<AudioContextState> state();
}

@freezed
sealed class AudioContextLatencyCategory with _$AudioContextLatencyCategory {
  const AudioContextLatencyCategory._();

  /// Balance audio output latency and power consumption.
  const factory AudioContextLatencyCategory.balanced() =
      AudioContextLatencyCategory_Balanced;

  /// Provide the lowest audio output latency possible without glitching. This is the default.
  const factory AudioContextLatencyCategory.interactive() =
      AudioContextLatencyCategory_Interactive;

  /// Prioritize sustained playback without interruption over audio output latency.
  ///
  /// Lowest power consumption.
  const factory AudioContextLatencyCategory.playback() =
      AudioContextLatencyCategory_Playback;

  /// Specify the number of seconds of latency
  ///
  /// This latency is not guaranteed to be applied, it depends on the audio hardware capabilities
  const factory AudioContextLatencyCategory.custom(
    double field0,
  ) = AudioContextLatencyCategory_Custom;
}

/// Specify the playback configuration for the [`AudioContext`] constructor.
///
/// All fields are optional and will default to the value best suited for interactive playback on
/// your hardware configuration.
///
/// For future compatibility, it is best to construct a default implementation of this struct and
/// set the fields you would like to override:
/// ```
/// use web_audio_api::context::AudioContextOptions;
///
/// // Request a sample rate of 44.1 kHz, leave other fields to their default values
/// let opts = AudioContextOptions {
///     sample_rate: Some(44100.),
///     ..AudioContextOptions::default()
/// };
class AudioContextOptions {
  /// Identify the type of playback, which affects tradeoffs between audio output latency and
  /// power consumption.
  final AudioContextLatencyCategory latencyHint;

  /// Sample rate of the audio context and audio output hardware. Use `None` for a default value.
  final double? sampleRate;

  /// The audio output device
  /// - use `""` for the default audio output device
  /// - use `"none"` to process the audio graph without playing through an audio output device.
  /// - use `"sinkId"` to use the specified audio sink id, obtained with [`enumerate_devices_sync`]
  final String sinkId;

  /// Option to request a default, optimized or specific render quantum size. It is a hint that might not be honored.
  final AudioContextRenderSizeCategory renderSizeHint;

  const AudioContextOptions({
    required this.latencyHint,
    this.sampleRate,
    required this.sinkId,
    required this.renderSizeHint,
  });

  @override
  int get hashCode =>
      latencyHint.hashCode ^
      sampleRate.hashCode ^
      sinkId.hashCode ^
      renderSizeHint.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioContextOptions &&
          runtimeType == other.runtimeType &&
          latencyHint == other.latencyHint &&
          sampleRate == other.sampleRate &&
          sinkId == other.sinkId &&
          renderSizeHint == other.renderSizeHint;
}

/// This allows users to ask for a particular render quantum size.
///
/// Currently, only the default value is available
enum AudioContextRenderSizeCategory {
  /// The default value of 128 frames
  Default,
  ;
}

/// Describes the current state of the `AudioContext`
enum AudioContextState {
  /// This context is currently suspended (context time is not proceeding,
  /// audio hardware may be powered down/released).
  suspended,

  /// Audio is being processed.
  running,

  /// This context has been released, and can no longer be used to process audio.
  /// All system audio resources have been released.
  closed,
  ;
}
