import 'dart:async';
import 'package:fight_log/domain/entities/round_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_provider.g.dart';

/// Timer state
class TimerState {
  final RoundConfig config;
  final int currentRound;
  final int secondsRemaining;
  final bool isResting;
  final bool isPaused;
  final bool isCompleted;
  final int totalSecondsElapsed;

  const TimerState({
    required this.config,
    required this.currentRound,
    required this.secondsRemaining,
    this.isResting = false,
    this.isPaused = false,
    this.isCompleted = false,
    this.totalSecondsElapsed = 0,
  });

  TimerState copyWith({
    RoundConfig? config,
    int? currentRound,
    int? secondsRemaining,
    bool? isResting,
    bool? isPaused,
    bool? isCompleted,
    int? totalSecondsElapsed,
  }) {
    return TimerState(
      config: config ?? this.config,
      currentRound: currentRound ?? this.currentRound,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isResting: isResting ?? this.isResting,
      isPaused: isPaused ?? this.isPaused,
      isCompleted: isCompleted ?? this.isCompleted,
      totalSecondsElapsed: totalSecondsElapsed ?? this.totalSecondsElapsed,
    );
  }

  /// Get current phase duration
  int get currentPhaseDuration {
    return isResting ? config.restDurationSeconds : config.roundDurationSeconds;
  }

  /// Get progress percentage (0.0 - 1.0)
  double get progress {
    return 1.0 - (secondsRemaining / currentPhaseDuration);
  }

  /// Check if in countdown warning zone (last 5 seconds)
  bool get isWarningZone => secondsRemaining <= 5 && secondsRemaining > 0;

  /// Get formatted time remaining (e.g., "2:30")
  String get formattedTimeRemaining {
    final minutes = secondsRemaining ~/ 60;
    final seconds = secondsRemaining % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get formatted total time elapsed (e.g., "15:30")
  String get formattedTotalTime {
    final minutes = totalSecondsElapsed ~/ 60;
    final seconds = totalSecondsElapsed % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

/// Timer controller provider
@riverpod
class TimerController extends _$TimerController {
  Timer? _timer;

  @override
  TimerState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    // Default state
    return TimerState(
      config: RoundConfig(
        id: 'default',
        numberOfRounds: 3,
        roundDurationSeconds: 180,
        restDurationSeconds: 60,
      ),
      currentRound: 1,
      secondsRemaining: 180,
    );
  }

  /// Initialize timer with a round configuration
  void initialize(RoundConfig config) {
    _timer?.cancel();
    state = TimerState(
      config: config,
      currentRound: 1,
      secondsRemaining: config.roundDurationSeconds,
    );
  }

  /// Start the timer
  void start() {
    if (state.isCompleted) return;

    state = state.copyWith(isPaused: false);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!state.isPaused && !state.isCompleted) {
        _tick();
      }
    });
  }

  /// Pause the timer
  void pause() {
    state = state.copyWith(isPaused: true);
  }

  /// Resume the timer
  void resume() {
    if (!state.isCompleted) {
      state = state.copyWith(isPaused: false);
    }
  }

  /// Skip current rest period
  void skipRest() {
    if (!state.isResting) return;

    // Move to next round
    if (state.currentRound < state.config.numberOfRounds) {
      state = state.copyWith(
        currentRound: state.currentRound + 1,
        secondsRemaining: state.config.roundDurationSeconds,
        isResting: false,
      );
    } else {
      // Workout complete
      _complete();
    }
  }

  /// Reset timer
  void reset() {
    _timer?.cancel();
    state = TimerState(
      config: state.config,
      currentRound: 1,
      secondsRemaining: state.config.roundDurationSeconds,
    );
  }

  /// Stop and reset timer
  void stop() {
    _timer?.cancel();
    state = state.copyWith(
      isPaused: true,
      currentRound: 1,
      secondsRemaining: state.config.roundDurationSeconds,
      isResting: false,
      totalSecondsElapsed: 0,
    );
  }

  void _tick() {
    if (state.secondsRemaining > 0) {
      // Countdown
      state = state.copyWith(
        secondsRemaining: state.secondsRemaining - 1,
        totalSecondsElapsed: state.totalSecondsElapsed + 1,
      );
    } else {
      // Phase complete
      if (state.isResting) {
        // Rest complete, move to next round
        if (state.currentRound < state.config.numberOfRounds) {
          state = state.copyWith(
            currentRound: state.currentRound + 1,
            secondsRemaining: state.config.roundDurationSeconds,
            isResting: false,
          );
        } else {
          // All rounds complete
          _complete();
        }
      } else {
        // Round complete
        if (state.currentRound < state.config.numberOfRounds) {
          // Start rest period
          state = state.copyWith(
            secondsRemaining: state.config.restDurationSeconds,
            isResting: true,
          );
        } else {
          // Last round complete
          _complete();
        }
      }
    }
  }

  void _complete() {
    _timer?.cancel();
    state = state.copyWith(
      isCompleted: true,
      isPaused: true,
      secondsRemaining: 0,
    );
  }
}
