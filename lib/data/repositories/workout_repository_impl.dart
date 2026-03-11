import 'package:drift/drift.dart' as drift;
import 'package:fight_log/data/database/app_database.dart';
import 'package:fight_log/domain/entities/workout.dart' as domain;
import 'package:fight_log/domain/repositories/workout_repository.dart';

/// Implementation of WorkoutRepository using Drift database
class WorkoutRepositoryImpl implements WorkoutRepository {
  final AppDatabase _database;

  WorkoutRepositoryImpl(this._database);

  @override
  Stream<List<domain.Workout>> watchAllWorkouts() {
    return _database.watchAllWorkouts();
  }

  @override
  Stream<List<domain.Workout>> watchWorkoutsInRange(DateTime start, DateTime end) {
    return _database.watchWorkoutsInRange(start, end);
  }

  @override
  Future<domain.Workout?> getWorkoutById(String id) {
    return _database.getWorkoutById(id);
  }

  @override
  Future<void> saveWorkout(domain.Workout workout) {
    final companion = WorkoutsCompanion(
      id: drift.Value(workout.id),
      completedAt: drift.Value(workout.completedAt),
      roundsCompleted: drift.Value(workout.roundsCompleted),
      totalDurationSeconds: drift.Value(workout.totalDurationSeconds),
      difficulty: drift.Value(workout.difficulty),
      notes: drift.Value(workout.notes),
      trainingPlanId: drift.Value(workout.trainingPlanId),
      configNumberOfRounds: drift.Value(workout.roundConfig.numberOfRounds),
      configRoundDurationSeconds:
          drift.Value(workout.roundConfig.roundDurationSeconds),
      configRestDurationSeconds:
          drift.Value(workout.roundConfig.restDurationSeconds),
      configName: drift.Value(workout.roundConfig.configName),
    );
    return _database.insertWorkout(companion);
  }

  @override
  Future<void> updateWorkout(domain.Workout workout) {
    final companion = WorkoutsCompanion(
      completedAt: drift.Value(workout.completedAt),
      roundsCompleted: drift.Value(workout.roundsCompleted),
      totalDurationSeconds: drift.Value(workout.totalDurationSeconds),
      difficulty: drift.Value(workout.difficulty),
      notes: drift.Value(workout.notes),
      trainingPlanId: drift.Value(workout.trainingPlanId),
      configNumberOfRounds: drift.Value(workout.roundConfig.numberOfRounds),
      configRoundDurationSeconds:
          drift.Value(workout.roundConfig.roundDurationSeconds),
      configRestDurationSeconds:
          drift.Value(workout.roundConfig.restDurationSeconds),
      configName: drift.Value(workout.roundConfig.configName),
    );
    return _database.updateWorkoutById(workout.id, companion);
  }

  @override
  Future<void> deleteWorkout(String id) async {
    await _database.deleteWorkoutById(id);
  }

  @override
  Future<WorkoutStats> getStats(DateTime start, DateTime end) async {
    final workouts = await _database.watchWorkoutsInRange(start, end).first;

    if (workouts.isEmpty) {
      return const WorkoutStats(
        totalWorkouts: 0,
        totalRounds: 0,
        totalSeconds: 0,
        averageDifficulty: 0,
        roundsPerDay: {},
      );
    }

    final totalRounds = workouts.fold<int>(
      0,
      (sum, workout) => sum + workout.roundsCompleted,
    );

    final totalSeconds = workouts.fold<int>(
      0,
      (sum, workout) => sum + workout.totalDurationSeconds,
    );

    final avgDifficulty = workouts.fold<int>(
          0,
          (sum, workout) => sum + workout.difficulty,
        ) /
        workouts.length;

    // Group by date
    final Map<DateTime, int> roundsPerDay = {};
    for (final workout in workouts) {
      final date = DateTime(
        workout.completedAt.year,
        workout.completedAt.month,
        workout.completedAt.day,
      );
      roundsPerDay[date] = (roundsPerDay[date] ?? 0) + workout.roundsCompleted;
    }

    return WorkoutStats(
      totalWorkouts: workouts.length,
      totalRounds: totalRounds,
      totalSeconds: totalSeconds,
      averageDifficulty: avgDifficulty,
      roundsPerDay: roundsPerDay,
    );
  }

  @override
  Future<int> getRoundsThisWeek() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    final end = start.add(const Duration(days: 7));

    return _database.getTotalRoundsInRange(start, end);
  }

  @override
  Future<int> getTimeThisWeek() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    final end = start.add(const Duration(days: 7));

    return _database.getTotalTimeInRange(start, end);
  }

  @override
  Future<int> getCurrentStreak() async {
    final allWorkouts = await _database.watchAllWorkouts().first;
    if (allWorkouts.isEmpty) return 0;

    // Sort by date
    final sorted = List<domain.Workout>.from(allWorkouts)
      ..sort((a, b) => b.completedAt.compareTo(a.completedAt));

    // Get unique dates
    final workoutDates = <DateTime>{};
    for (final workout in sorted) {
      final date = DateTime(
        workout.completedAt.year,
        workout.completedAt.month,
        workout.completedAt.day,
      );
      workoutDates.add(date);
    }

    final uniqueDates = workoutDates.toList()..sort((a, b) => b.compareTo(a));

    // Check if most recent workout was today or yesterday
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    final yesterday = todayDate.subtract(const Duration(days: 1));

    if (uniqueDates.first != todayDate && uniqueDates.first != yesterday) {
      return 0; // Streak broken
    }

    // Count consecutive days
    int streak = 1;
    for (int i = 1; i < uniqueDates.length; i++) {
      final diff = uniqueDates[i - 1].difference(uniqueDates[i]).inDays;
      if (diff == 1) {
        streak++;
      } else {
        break;
      }
    }

    return streak;
  }
}
