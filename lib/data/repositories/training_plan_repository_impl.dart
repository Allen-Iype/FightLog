import 'package:drift/drift.dart' as drift;
import 'package:fight_log/data/database/app_database.dart';
import 'package:fight_log/domain/entities/training_plan.dart' as domain;
import 'package:fight_log/domain/repositories/training_plan_repository.dart';
import 'package:uuid/uuid.dart';

/// Implementation of TrainingPlanRepository using Drift database
class TrainingPlanRepositoryImpl implements TrainingPlanRepository {
  final AppDatabase _database;
  final _uuid = const Uuid();

  TrainingPlanRepositoryImpl(this._database);

  @override
  Stream<List<domain.TrainingPlan>> watchAllPlans() {
    return _database
        .watchAllTrainingPlans()
        .map((plans) => plans.map((p) => p.toEntity()).toList());
  }

  @override
  Stream<List<domain.TrainingPlan>> watchTemplates() {
    return _database
        .watchTemplates()
        .map((plans) => plans.map((p) => p.toEntity()).toList());
  }

  @override
  Future<domain.TrainingPlan?> getPlanById(String id) async {
    final result = await _database.getTrainingPlanById(id);
    return result?.toEntity();
  }

  @override
  Future<void> savePlan(domain.TrainingPlan plan) async {
    final planCompanion = TrainingPlansCompanion(
      id: drift.Value(plan.id),
      name: drift.Value(plan.name),
      description: drift.Value(plan.description),
      createdAt: drift.Value(plan.createdAt),
      lastUsedAt: drift.Value(plan.lastUsedAt),
      isTemplate: drift.Value(plan.isTemplate),
    );

    final dayCompanions = plan.days
        .map((day) => TrainingDaysCompanion(
              id: drift.Value(day.id),
              planId: drift.Value(plan.id),
              name: drift.Value(day.name),
              dayNumber: drift.Value(day.dayNumber),
              numberOfRounds: drift.Value(day.numberOfRounds),
              roundDurationSeconds: drift.Value(day.roundDurationSeconds),
              restDurationSeconds: drift.Value(day.restDurationSeconds),
              notes: drift.Value(day.notes),
            ))
        .toList();

    await _database.insertTrainingPlanWithDays(planCompanion, dayCompanions);
  }

  @override
  Future<void> updatePlan(domain.TrainingPlan plan) async {
    final planCompanion = TrainingPlansCompanion(
      name: drift.Value(plan.name),
      description: drift.Value(plan.description),
      lastUsedAt: drift.Value(plan.lastUsedAt),
      isTemplate: drift.Value(plan.isTemplate),
    );

    await _database.updateTrainingPlanById(plan.id, planCompanion);

    // Delete existing days and re-insert
    await _database.deleteDaysForPlan(plan.id);

    final dayCompanions = plan.days
        .map((day) => TrainingDaysCompanion(
              id: drift.Value(day.id),
              planId: drift.Value(plan.id),
              name: drift.Value(day.name),
              dayNumber: drift.Value(day.dayNumber),
              numberOfRounds: drift.Value(day.numberOfRounds),
              roundDurationSeconds: drift.Value(day.roundDurationSeconds),
              restDurationSeconds: drift.Value(day.restDurationSeconds),
              notes: drift.Value(day.notes),
            ))
        .toList();

    for (final day in dayCompanions) {
      await _database.into(_database.trainingDays).insert(day);
    }
  }

  @override
  Future<void> deletePlan(String id) {
    return _database.deleteTrainingPlanById(id);
  }

  @override
  Future<domain.TrainingPlan> duplicatePlan(String id, String newName) async {
    final original = await getPlanById(id);
    if (original == null) {
      throw Exception('Training plan not found');
    }

    final newPlan = original.copyWith(
      id: _uuid.v4(),
      name: newName,
      createdAt: DateTime.now(),
      lastUsedAt: null,
      days: original.days
          .map((day) => day.copyWith(
                id: _uuid.v4(),
              ))
          .toList(),
    );

    await savePlan(newPlan);
    return newPlan;
  }

  @override
  Future<void> markPlanAsUsed(String id) async {
    final companion = TrainingPlansCompanion(
      lastUsedAt: drift.Value(DateTime.now()),
    );
    await _database.updateTrainingPlanById(id, companion);
  }
}
