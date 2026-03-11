/// Represents a completed workout session
class Workout {
  final String id;
  final DateTime completedAt;
  final int roundsCompleted;
  final int totalDurationSeconds;
  final int difficulty; // 1-10 scale
  final String? notes;
  final String? trainingPlanId;
  final RoundConfigSnapshot roundConfig;

  const Workout({
    required this.id,
    required this.completedAt,
    required this.roundsCompleted,
    required this.totalDurationSeconds,
    required this.difficulty,
    this.notes,
    this.trainingPlanId,
    required this.roundConfig,
  });

  Workout copyWith({
    String? id,
    DateTime? completedAt,
    int? roundsCompleted,
    int? totalDurationSeconds,
    int? difficulty,
    String? notes,
    String? trainingPlanId,
    RoundConfigSnapshot? roundConfig,
  }) {
    return Workout(
      id: id ?? this.id,
      completedAt: completedAt ?? this.completedAt,
      roundsCompleted: roundsCompleted ?? this.roundsCompleted,
      totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
      difficulty: difficulty ?? this.difficulty,
      notes: notes ?? this.notes,
      trainingPlanId: trainingPlanId ?? this.trainingPlanId,
      roundConfig: roundConfig ?? this.roundConfig,
    );
  }

  /// Get formatted duration (e.g., "15:30")
  String get formattedDuration {
    final minutes = totalDurationSeconds ~/ 60;
    final seconds = totalDurationSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get formatted date (e.g., "Jan 15, 2025")
  String get formattedDate {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[completedAt.month - 1]} ${completedAt.day}, ${completedAt.year}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Workout &&
        other.id == id &&
        other.completedAt == completedAt &&
        other.roundsCompleted == roundsCompleted &&
        other.totalDurationSeconds == totalDurationSeconds &&
        other.difficulty == difficulty &&
        other.notes == notes &&
        other.trainingPlanId == trainingPlanId &&
        other.roundConfig == roundConfig;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      completedAt,
      roundsCompleted,
      totalDurationSeconds,
      difficulty,
      notes,
      trainingPlanId,
      roundConfig,
    );
  }
}

/// Snapshot of round configuration at the time of workout
/// Stored denormalized so we can track what the workout was even if config changes
class RoundConfigSnapshot {
  final int numberOfRounds;
  final int roundDurationSeconds;
  final int restDurationSeconds;
  final String? configName;

  const RoundConfigSnapshot({
    required this.numberOfRounds,
    required this.roundDurationSeconds,
    required this.restDurationSeconds,
    this.configName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoundConfigSnapshot &&
        other.numberOfRounds == numberOfRounds &&
        other.roundDurationSeconds == roundDurationSeconds &&
        other.restDurationSeconds == restDurationSeconds &&
        other.configName == configName;
  }

  @override
  int get hashCode {
    return Object.hash(
      numberOfRounds,
      roundDurationSeconds,
      restDurationSeconds,
      configName,
    );
  }
}
