import 'package:drift/drift.dart';

/// Table definition for workouts
class Workouts extends Table {
  TextColumn get id => text()();
  DateTimeColumn get completedAt => dateTime()();
  IntColumn get roundsCompleted => integer()();
  IntColumn get totalDurationSeconds => integer()();
  IntColumn get difficulty => integer()();
  TextColumn get notes => text().nullable()();
  TextColumn get trainingPlanId => text().nullable()();

  // Round config snapshot
  IntColumn get configNumberOfRounds => integer()();
  IntColumn get configRoundDurationSeconds => integer()();
  IntColumn get configRestDurationSeconds => integer()();
  TextColumn get configName => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
