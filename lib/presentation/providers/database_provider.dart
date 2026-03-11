import 'package:fight_log/data/database/app_database.dart';
import 'package:fight_log/data/repositories/training_plan_repository_impl.dart';
import 'package:fight_log/data/repositories/workout_repository_impl.dart';
import 'package:fight_log/domain/repositories/training_plan_repository.dart';
import 'package:fight_log/domain/repositories/workout_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

/// Provides the singleton database instance
@riverpod
AppDatabase database(DatabaseRef ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
}

/// Provides the workout repository
@riverpod
WorkoutRepository workoutRepository(WorkoutRepositoryRef ref) {
  return WorkoutRepositoryImpl(ref.watch(databaseProvider));
}

/// Provides the training plan repository
@riverpod
TrainingPlanRepository trainingPlanRepository(
    TrainingPlanRepositoryRef ref) {
  return TrainingPlanRepositoryImpl(ref.watch(databaseProvider));
}
