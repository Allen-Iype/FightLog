/// Represents the configuration for rounds in a training session
class RoundConfig {
  final String id;
  final int numberOfRounds;
  final int roundDurationSeconds;
  final int restDurationSeconds;
  final bool enableSound;
  final bool enableVibration;
  final String? name;

  const RoundConfig({
    required this.id,
    required this.numberOfRounds,
    required this.roundDurationSeconds,
    required this.restDurationSeconds,
    this.enableSound = true,
    this.enableVibration = true,
    this.name,
  });

  RoundConfig copyWith({
    String? id,
    int? numberOfRounds,
    int? roundDurationSeconds,
    int? restDurationSeconds,
    bool? enableSound,
    bool? enableVibration,
    String? name,
  }) {
    return RoundConfig(
      id: id ?? this.id,
      numberOfRounds: numberOfRounds ?? this.numberOfRounds,
      roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
      restDurationSeconds: restDurationSeconds ?? this.restDurationSeconds,
      enableSound: enableSound ?? this.enableSound,
      enableVibration: enableVibration ?? this.enableVibration,
      name: name ?? this.name,
    );
  }

  /// Get total duration in seconds for all rounds including rest
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

    return other is RoundConfig &&
        other.id == id &&
        other.numberOfRounds == numberOfRounds &&
        other.roundDurationSeconds == roundDurationSeconds &&
        other.restDurationSeconds == restDurationSeconds &&
        other.enableSound == enableSound &&
        other.enableVibration == enableVibration &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      numberOfRounds,
      roundDurationSeconds,
      restDurationSeconds,
      enableSound,
      enableVibration,
      name,
    );
  }
}
