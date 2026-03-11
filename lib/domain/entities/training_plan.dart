/// Represents a training plan with multiple days/sessions
class TrainingPlan {
  final String id;
  final String name;
  final String? description;
  final List<TrainingDay> days;
  final DateTime createdAt;
  final DateTime? lastUsedAt;
  final bool isTemplate;

  const TrainingPlan({
    required this.id,
    required this.name,
    this.description,
    required this.days,
    required this.createdAt,
    this.lastUsedAt,
    this.isTemplate = false,
  });

  TrainingPlan copyWith({
    String? id,
    String? name,
    String? description,
    List<TrainingDay>? days,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    bool? isTemplate,
  }) {
    return TrainingPlan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      days: days ?? this.days,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      isTemplate: isTemplate ?? this.isTemplate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingPlan &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        _listEquals(other.days, days) &&
        other.createdAt == createdAt &&
        other.lastUsedAt == lastUsedAt &&
        other.isTemplate == isTemplate;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      description,
      Object.hashAll(days),
      createdAt,
      lastUsedAt,
      isTemplate,
    );
  }

  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }
}

/// Represents a single day/session within a training plan
class TrainingDay {
  final String id;
  final String name;
  final int dayNumber;
  final int numberOfRounds;
  final int roundDurationSeconds;
  final int restDurationSeconds;
  final String? notes;

  const TrainingDay({
    required this.id,
    required this.name,
    required this.dayNumber,
    required this.numberOfRounds,
    required this.roundDurationSeconds,
    required this.restDurationSeconds,
    this.notes,
  });

  TrainingDay copyWith({
    String? id,
    String? name,
    int? dayNumber,
    int? numberOfRounds,
    int? roundDurationSeconds,
    int? restDurationSeconds,
    String? notes,
  }) {
    return TrainingDay(
      id: id ?? this.id,
      name: name ?? this.name,
      dayNumber: dayNumber ?? this.dayNumber,
      numberOfRounds: numberOfRounds ?? this.numberOfRounds,
      roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
      restDurationSeconds: restDurationSeconds ?? this.restDurationSeconds,
      notes: notes ?? this.notes,
    );
  }

  /// Get total duration in seconds
  int get totalDurationSeconds {
    return (numberOfRounds * roundDurationSeconds) +
        ((numberOfRounds - 1) * restDurationSeconds);
  }

  /// Get formatted total time (e.g., "15:00")
  String get formattedTotalTime {
    final minutes = totalDurationSeconds ~/ 60;
    final seconds = totalDurationSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingDay &&
        other.id == id &&
        other.name == name &&
        other.dayNumber == dayNumber &&
        other.numberOfRounds == numberOfRounds &&
        other.roundDurationSeconds == roundDurationSeconds &&
        other.restDurationSeconds == restDurationSeconds &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      dayNumber,
      numberOfRounds,
      roundDurationSeconds,
      restDurationSeconds,
      notes,
    );
  }
}
