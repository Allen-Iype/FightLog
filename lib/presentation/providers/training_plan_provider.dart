import 'package:fight_log/domain/entities/training_plan.dart';
import 'package:fight_log/presentation/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'training_plan_provider.g.dart';

/// Provides a stream of all training plans
@riverpod
Stream<List<TrainingPlan>> allTrainingPlans(AllTrainingPlansRef ref) {
  final repository = ref.watch(trainingPlanRepositoryProvider);
  return repository.watchAllPlans();
}

/// Provides a stream of template training plans
@riverpod
Stream<List<TrainingPlan>> templatePlans(TemplatePlansRef ref) {
  final repository = ref.watch(trainingPlanRepositoryProvider);
  return repository.watchTemplates();
}

/// Provides actions for training plan operations
@riverpod
class TrainingPlanActions extends _$TrainingPlanActions {
  @override
  void build() {}

  Future<void> savePlan(TrainingPlan plan) async {
    final repository = ref.read(trainingPlanRepositoryProvider);
    await repository.savePlan(plan);

    // Invalidate related providers to refresh data
    ref.invalidate(allTrainingPlansProvider);
    ref.invalidate(templatePlansProvider);
  }

  Future<void> updatePlan(TrainingPlan plan) async {
    final repository = ref.read(trainingPlanRepositoryProvider);
    await repository.updatePlan(plan);

    // Invalidate related providers to refresh data
    ref.invalidate(allTrainingPlansProvider);
    ref.invalidate(templatePlansProvider);
  }

  Future<void> deletePlan(String id) async {
    final repository = ref.read(trainingPlanRepositoryProvider);
    await repository.deletePlan(id);

    // Invalidate related providers to refresh data
    ref.invalidate(allTrainingPlansProvider);
    ref.invalidate(templatePlansProvider);
  }

  Future<TrainingPlan> duplicatePlan(String id, String newName) async {
    final repository = ref.read(trainingPlanRepositoryProvider);
    final newPlan = await repository.duplicatePlan(id, newName);

    // Invalidate related providers to refresh data
    ref.invalidate(allTrainingPlansProvider);
    ref.invalidate(templatePlansProvider);

    return newPlan;
  }

  Future<void> markPlanAsUsed(String id) async {
    final repository = ref.read(trainingPlanRepositoryProvider);
    await repository.markPlanAsUsed(id);

    // Invalidate related providers to refresh data
    ref.invalidate(allTrainingPlansProvider);
    ref.invalidate(templatePlansProvider);
  }
}
