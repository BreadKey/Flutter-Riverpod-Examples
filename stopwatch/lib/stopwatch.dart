import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stopwatch.g.dart';
part 'stopwatch.freezed.dart';

@freezed
class StopwatchState with _$StopwatchState {
  const factory StopwatchState(
      {@Default(false) bool onRunning,
      @Default(Duration.zero) Duration duration}) = _StopwatchState;
}

@riverpod
class Stopwatch extends _$Stopwatch {
  Timer? timer;

  @override
  StopwatchState build() {
    ref.onDispose(() {
      timer?.cancel();
    });
    return const StopwatchState();
  }

  void start() {
    _runTimer();
    state = state.copyWith(onRunning: true);
  }

  void _runTimer() {
    timer?.cancel();
    DateTime currentDateTime = DateTime.now();
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final now = DateTime.now();

      state = state.copyWith(
          duration: state.duration + (now.difference(currentDateTime)));

      currentDateTime = now;
    });
  }

  void stop() {
    timer?.cancel();
    state = state.copyWith(onRunning: false);
  }

  void reset() {
    timer?.cancel();
    state = const StopwatchState();
  }
}
