import 'package:fight_log/domain/entities/workout.dart';
import 'package:fight_log/domain/repositories/workout_repository.dart';
import 'package:fight_log/presentation/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_provider.g.dart';

/// Provides a stream of all workouts
@riverpod
Stream<List<Workout>> allWorkouts(AllWorkoutsRef ref) {
  final repository = ref.watch(workoutRepositoryProvider);
  return repository.watchAllWorkouts();
}

/// Provides a stream of workouts in a date range
@riverpod
Stream<List<Workout>> workoutsInRange(
  WorkoutsInRangeRef ref,
  DateTime start,
  DateTime end,
) {
  final repository = ref.watch(workoutRepositoryProvider);
  return repository.watchWorkoutsInRange(start, end);
}

/// Provides workout statistics for the current week
@riverpod
Future<WorkoutStats> weeklyStats(WeeklyStatsRef ref) async {
  final repository = ref.watch(workoutRepositoryProvider);
  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final start = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
  final end = start.add(const Duration(days: 7));

  return repository.getStats(start, end);
}

/// Provides workout statistics for the current month
@riverpod
Future<WorkoutStats> monthlyStats(MonthlyStatsRef ref) async {
  final repository = ref.watch(workoutRepositoryProvider);
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, 1);
  final end = DateTime(now.year, now.month + 1, 1);

  return repository.getStats(start, end);
}

/// Provides total rounds this week
@riverpod
Future<int> roundsThisWeek(RoundsThisWeekRef ref) {
  final repository = ref.watch(workoutRepositoryProvider);
  return repository.getRoundsThisWeek();
}

/// Provides total time this week (in seconds)
@riverpod
Future<int> timeThisWeek(TimeThisWeekRef ref) {
  final repository = ref.watch(workoutRepositoryProvider);
  return repository.getTimeThisWeek();
}

/// Provides current training streak
@riverpod
Future<int> currentStreak(CurrentStreakRef ref) {
  final repository = ref.watch(workoutRepositoryProvider);
  return repository.getCurrentStreak();
}

/// Provides actions for workout operations
@riverpod
class WorkoutActions extends _$WorkoutActions {
  @override
  void build() {}

  Future<void> saveWorkout(Workout workout) async {
    final repository = ref.read(workoutRepositoryProvider);
    await repository.saveWorkout(workout);

    // Invalidate related providers to refresh data
    ref.invalidate(allWorkoutsProvider);
    ref.invalidate(weeklyStatsProvider);
    ref.invalidate(monthlyStatsProvider);
    ref.invalidate(roundsThisWeekProvider);
    ref.invalidate(timeThisWeekProvider);
    ref.invalidate(currentStreakProvider);
  }

  Future<void> updateWorkout(Workout workout) async {
    final repository = ref.read(workoutRepositoryProvider);
    await repository.updateWorkout(workout);

    // Invalidate related providers to refresh data
    ref.invalidate(allWorkoutsProvider);
    ref.invalidate(weeklyStatsProvider);
    ref.invalidate(monthlyStatsProvider);
    ref.invalidate(roundsThisWeekProvider);
    ref.invalidate(timeThisWeekProvider);
    ref.invalidate(currentStreakProvider);
  }

  Future<void> deleteWorkout(String id) async {
    final repository = ref.read(workoutRepositoryProvider);
    await repository.deleteWorkout(id);

    // Invalidate related providers to refresh data
    ref.invalidate(allWorkoutsProvider);
    ref.invalidate(weeklyStatsProvider);
    ref.invalidate(monthlyStatsProvider);
    ref.invalidate(roundsThisWeekProvider);
    ref.invalidate(timeThisWeekProvider);
    ref.invalidate(currentStreakProvider);
  }
}
