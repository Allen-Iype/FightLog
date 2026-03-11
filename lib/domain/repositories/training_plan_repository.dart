import '../entities/training_plan.dart';

/// Repository interface for training plan operations
abstract class TrainingPlanRepository {
  /// Watch all training plans
  Stream<List<TrainingPlan>> watchAllPlans();

  /// Watch only template plans
  Stream<List<TrainingPlan>> watchTemplates();

  /// Get a single plan by ID
  Future<TrainingPlan?> getPlanById(String id);

  /// Save a new training plan
  Future<void> savePlan(TrainingPlan plan);

  /// Update an existing plan
  Future<void> updatePlan(TrainingPlan plan);

  /// Delete a plan
  Future<void> deletePlan(String id);

  /// Duplicate a plan (useful for creating variations)
  Future<TrainingPlan> duplicatePlan(String id, String newName);

  /// Mark a plan as used (updates lastUsedAt)
  Future<void> markPlanAsUsed(String id);
}
