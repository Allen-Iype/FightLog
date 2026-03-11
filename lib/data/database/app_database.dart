import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:fight_log/data/database/tables/training_plans_table.dart';
import 'package:fight_log/data/database/tables/workouts_table.dart';
import 'package:fight_log/domain/entities/training_plan.dart' as domain;
import 'package:fight_log/domain/entities/workout.dart' as domain;

part 'app_database.g.dart';

/// Main database class for FightLog
/// Uses Drift for type-safe SQL operations
@DriftDatabase(tables: [Workouts, TrainingPlans, TrainingDays])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'fight_log_db');
  }

  // ========== Workout Operations ==========

  /// Watch all workouts, ordered by date (newest first)
  Stream<List<domain.Workout>> watchAllWorkouts() {
    return (select(workouts)
          ..orderBy([
            (t) => OrderingTerm(expression: t.completedAt, mode: OrderingMode.desc)
          ]))
        .watch()
        .asyncMap((rows) async {
      return rows.map((row) => _mapToWorkout(row)).toList().cast<domain.Workout>();
    });
  }

  /// Watch workouts in a date range
  Stream<List<domain.Workout>> watchWorkoutsInRange(
      DateTime start, DateTime end) {
    return (select(workouts)
          ..where((t) =>
              t.completedAt.isBiggerOrEqualValue(start) &
              t.completedAt.isSmallerOrEqualValue(end))
          ..orderBy([
            (t) => OrderingTerm(expression: t.completedAt, mode: OrderingMode.desc)
          ]))
        .watch()
        .asyncMap((rows) async {
      return rows.map((row) => _mapToWorkout(row)).toList().cast<domain.Workout>();
    });
  }

  /// Get a single workout by ID
  Future<domain.Workout?> getWorkoutById(String id) async {
    final result = await (select(workouts)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return result != null ? _mapToWorkout(result) : null;
  }

  /// Insert a workout
  Future<int> insertWorkout(WorkoutsCompanion workout) {
    return into(workouts).insert(workout);
  }

  /// Update a workout
  Future<void> updateWorkoutById(String id, WorkoutsCompanion workout) async {
    await (update(workouts)..where((t) => t.id.equals(id))).write(workout);
  }

  /// Delete a workout
  Future<int> deleteWorkoutById(String id) {
    return (delete(workouts)..where((t) => t.id.equals(id))).go();
  }

  /// Get workout count in date range
  Future<int> getWorkoutCountInRange(DateTime start, DateTime end) async {
    final query = selectOnly(workouts)
      ..where(workouts.completedAt.isBiggerOrEqualValue(start) &
          workouts.completedAt.isSmallerOrEqualValue(end))
      ..addColumns([workouts.id.count()]);

    final result = await query.getSingleOrNull();
    return result?.read(workouts.id.count()) ?? 0;
  }

  /// Get total rounds in date range
  Future<int> getTotalRoundsInRange(DateTime start, DateTime end) async {
    final query = selectOnly(workouts)
      ..where(workouts.completedAt.isBiggerOrEqualValue(start) &
          workouts.completedAt.isSmallerOrEqualValue(end))
      ..addColumns([workouts.roundsCompleted.sum()]);

    final result = await query.getSingleOrNull();
    return result?.read(workouts.roundsCompleted.sum()) ?? 0;
  }

  /// Get total time in date range (in seconds)
  Future<int> getTotalTimeInRange(DateTime start, DateTime end) async {
    final query = selectOnly(workouts)
      ..where(workouts.completedAt.isBiggerOrEqualValue(start) &
          workouts.completedAt.isSmallerOrEqualValue(end))
      ..addColumns([workouts.totalDurationSeconds.sum()]);

    final result = await query.getSingleOrNull();
    return result?.read(workouts.totalDurationSeconds.sum()) ?? 0;
  }

  // ========== Training Plan Operations ==========

  /// Watch all training plans
  Stream<List<TrainingPlanWithDays>> watchAllTrainingPlans() {
    return select(trainingPlans).watch().asyncMap((plans) async {
      final result = <TrainingPlanWithDays>[];
      for (final plan in plans) {
        final days = await _getDaysForPlan(plan.id);
        result.add(TrainingPlanWithDays(plan: plan, days: days));
      }
      return result;
    });
  }

  /// Watch only template plans
  Stream<List<TrainingPlanWithDays>> watchTemplates() {
    return (select(trainingPlans)..where((t) => t.isTemplate.equals(true)))
        .watch()
        .asyncMap((plans) async {
      final result = <TrainingPlanWithDays>[];
      for (final plan in plans) {
        final days = await _getDaysForPlan(plan.id);
        result.add(TrainingPlanWithDays(plan: plan, days: days));
      }
      return result;
    });
  }

  /// Get a training plan by ID with its days
  Future<TrainingPlanWithDays?> getTrainingPlanById(String id) async {
    final plan =
        await (select(trainingPlans)..where((t) => t.id.equals(id)))
            .getSingleOrNull();
    if (plan == null) return null;

    final days = await _getDaysForPlan(id);
    return TrainingPlanWithDays(plan: plan, days: days);
  }

  /// Get days for a specific plan
  Future<List<domain.TrainingDay>> _getDaysForPlan(String planId) async {
    final dayRows = await (select(trainingDays)
          ..where((t) => t.planId.equals(planId))
          ..orderBy([(t) => OrderingTerm(expression: t.dayNumber)]))
        .get();

    return dayRows
        .map((row) => domain.TrainingDay(
              id: row.id,
              name: row.name,
              dayNumber: row.dayNumber,
              numberOfRounds: row.numberOfRounds,
              roundDurationSeconds: row.roundDurationSeconds,
              restDurationSeconds: row.restDurationSeconds,
              notes: row.notes,
            ))
        .toList();
  }

  /// Insert a training plan with its days
  Future<void> insertTrainingPlanWithDays(
      TrainingPlansCompanion plan, List<TrainingDaysCompanion> days) async {
    await transaction(() async {
      await into(trainingPlans).insert(plan);
      for (final day in days) {
        await into(trainingDays).insert(day);
      }
    });
  }

  /// Update a training plan
  Future<void> updateTrainingPlanById(
      String id, TrainingPlansCompanion plan) async {
    await (update(trainingPlans)..where((t) => t.id.equals(id))).write(plan);
  }

  /// Delete a training plan and its days
  Future<void> deleteTrainingPlanById(String id) async {
    await transaction(() async {
      await (delete(trainingDays)..where((t) => t.planId.equals(id))).go();
      await (delete(trainingPlans)..where((t) => t.id.equals(id))).go();
    });
  }

  /// Delete all days for a plan
  Future<int> deleteDaysForPlan(String planId) {
    return (delete(trainingDays)..where((t) => t.planId.equals(planId))).go();
  }

  // ========== Helper Methods ==========

  domain.Workout _mapToWorkout(Workout row) {
    return domain.Workout(
      id: row.id,
      completedAt: row.completedAt,
      roundsCompleted: row.roundsCompleted,
      totalDurationSeconds: row.totalDurationSeconds,
      difficulty: row.difficulty,
      notes: row.notes,
      trainingPlanId: row.trainingPlanId,
      roundConfig: domain.RoundConfigSnapshot(
        numberOfRounds: row.configNumberOfRounds,
        roundDurationSeconds: row.configRoundDurationSeconds,
        restDurationSeconds: row.configRestDurationSeconds,
        configName: row.configName,
      ),
    );
  }
}

/// Helper class to group plan with its days
class TrainingPlanWithDays {
  final TrainingPlan plan;
  final List<domain.TrainingDay> days;

  TrainingPlanWithDays({
    required this.plan,
    required this.days,
  });

  domain.TrainingPlan toEntity() {
    return domain.TrainingPlan(
      id: plan.id,
      name: plan.name,
      description: plan.description,
      days: days,
      createdAt: plan.createdAt,
      lastUsedAt: plan.lastUsedAt,
      isTemplate: plan.isTemplate,
    );
  }
}
