import 'package:drift/drift.dart';

/// Table definition for training plans
class TrainingPlans extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastUsedAt => dateTime().nullable()();
  BoolColumn get isTemplate => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Table definition for training days (belongs to a training plan)
class TrainingDays extends Table {
  TextColumn get id => text()();
  TextColumn get planId => text()();
  TextColumn get name => text()();
  IntColumn get dayNumber => integer()();
  IntColumn get numberOfRounds => integer()();
  IntColumn get roundDurationSeconds => integer()();
  IntColumn get restDurationSeconds => integer()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
