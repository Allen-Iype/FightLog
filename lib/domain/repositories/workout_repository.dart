import '../entities/workout.dart';

/// Repository interface for workout operations
/// This abstraction allows for easy testing and future cloud sync
abstract class WorkoutRepository {
  /// Get all workouts, ordered by date (newest first)
  Stream<List<Workout>> watchAllWorkouts();

  /// Get workouts for a specific date range
  Stream<List<Workout>> watchWorkoutsInRange(DateTime start, DateTime end);

  /// Get a single workout by ID
  Future<Workout?> getWorkoutById(String id);

  /// Save a new workout
  Future<void> saveWorkout(Workout workout);

  /// Update an existing workout
  Future<void> updateWorkout(Workout workout);

  /// Delete a workout
  Future<void> deleteWorkout(String id);

  /// Get workout statistics for a date range
  Future<WorkoutStats> getStats(DateTime start, DateTime end);

  /// Get total rounds completed this week
  Future<int> getRoundsThisWeek();

  /// Get total time trained this week (in seconds)
  Future<int> getTimeThisWeek();

  /// Get current training streak (consecutive days with workouts)
  Future<int> getCurrentStreak();
}

/// Statistics for workouts in a given period
class WorkoutStats {
  final int totalWorkouts;
  final int totalRounds;
  final int totalSeconds;
  final double averageDifficulty;
  final Map<DateTime, int> roundsPerDay; // Date -> rounds count

  const WorkoutStats({
    required this.totalWorkouts,
    required this.totalRounds,
    required this.totalSeconds,
    required this.averageDifficulty,
    required this.roundsPerDay,
  });

  /// Get formatted total time (e.g., "2h 15m")
  String get formattedTotalTime {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}
