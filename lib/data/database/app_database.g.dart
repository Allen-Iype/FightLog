// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorkoutsTable extends Workouts
    with TableInfo<$WorkoutsTable, domain.Workout> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roundsCompletedMeta = const VerificationMeta(
    'roundsCompleted',
  );
  @override
  late final GeneratedColumn<int> roundsCompleted = GeneratedColumn<int>(
    'rounds_completed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalDurationSecondsMeta =
      const VerificationMeta('totalDurationSeconds');
  @override
  late final GeneratedColumn<int> totalDurationSeconds = GeneratedColumn<int>(
    'total_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<int> difficulty = GeneratedColumn<int>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainingPlanIdMeta = const VerificationMeta(
    'trainingPlanId',
  );
  @override
  late final GeneratedColumn<String> trainingPlanId = GeneratedColumn<String>(
    'training_plan_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _configNumberOfRoundsMeta =
      const VerificationMeta('configNumberOfRounds');
  @override
  late final GeneratedColumn<int> configNumberOfRounds = GeneratedColumn<int>(
    'config_number_of_rounds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _configRoundDurationSecondsMeta =
      const VerificationMeta('configRoundDurationSeconds');
  @override
  late final GeneratedColumn<int> configRoundDurationSeconds =
      GeneratedColumn<int>(
        'config_round_duration_seconds',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _configRestDurationSecondsMeta =
      const VerificationMeta('configRestDurationSeconds');
  @override
  late final GeneratedColumn<int> configRestDurationSeconds =
      GeneratedColumn<int>(
        'config_rest_duration_seconds',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _configNameMeta = const VerificationMeta(
    'configName',
  );
  @override
  late final GeneratedColumn<String> configName = GeneratedColumn<String>(
    'config_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    completedAt,
    roundsCompleted,
    totalDurationSeconds,
    difficulty,
    notes,
    trainingPlanId,
    configNumberOfRounds,
    configRoundDurationSeconds,
    configRestDurationSeconds,
    configName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workouts';
  @override
  VerificationContext validateIntegrity(
    Insertable<domain.Workout> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('rounds_completed')) {
      context.handle(
        _roundsCompletedMeta,
        roundsCompleted.isAcceptableOrUnknown(
          data['rounds_completed']!,
          _roundsCompletedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_roundsCompletedMeta);
    }
    if (data.containsKey('total_duration_seconds')) {
      context.handle(
        _totalDurationSecondsMeta,
        totalDurationSeconds.isAcceptableOrUnknown(
          data['total_duration_seconds']!,
          _totalDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalDurationSecondsMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('training_plan_id')) {
      context.handle(
        _trainingPlanIdMeta,
        trainingPlanId.isAcceptableOrUnknown(
          data['training_plan_id']!,
          _trainingPlanIdMeta,
        ),
      );
    }
    if (data.containsKey('config_number_of_rounds')) {
      context.handle(
        _configNumberOfRoundsMeta,
        configNumberOfRounds.isAcceptableOrUnknown(
          data['config_number_of_rounds']!,
          _configNumberOfRoundsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_configNumberOfRoundsMeta);
    }
    if (data.containsKey('config_round_duration_seconds')) {
      context.handle(
        _configRoundDurationSecondsMeta,
        configRoundDurationSeconds.isAcceptableOrUnknown(
          data['config_round_duration_seconds']!,
          _configRoundDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_configRoundDurationSecondsMeta);
    }
    if (data.containsKey('config_rest_duration_seconds')) {
      context.handle(
        _configRestDurationSecondsMeta,
        configRestDurationSeconds.isAcceptableOrUnknown(
          data['config_rest_duration_seconds']!,
          _configRestDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_configRestDurationSecondsMeta);
    }
    if (data.containsKey('config_name')) {
      context.handle(
        _configNameMeta,
        configName.isAcceptableOrUnknown(data['config_name']!, _configNameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  domain.Workout map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Workout(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      roundsCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rounds_completed'],
      )!,
      totalDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_duration_seconds'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}difficulty'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      trainingPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}training_plan_id'],
      ),
      configNumberOfRounds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}config_number_of_rounds'],
      )!,
      configRoundDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}config_round_duration_seconds'],
      )!,
      configRestDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}config_rest_duration_seconds'],
      )!,
      configName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}config_name'],
      ),
    );
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(attachedDatabase, alias);
  }
}

class Workout extends DataClass implements Insertable<domain.Workout> {
  final String id;
  final DateTime completedAt;
  final int roundsCompleted;
  final int totalDurationSeconds;
  final int difficulty;
  final String? notes;
  final String? trainingPlanId;
  final int configNumberOfRounds;
  final int configRoundDurationSeconds;
  final int configRestDurationSeconds;
  final String? configName;
  const Workout({
    required this.id,
    required this.completedAt,
    required this.roundsCompleted,
    required this.totalDurationSeconds,
    required this.difficulty,
    this.notes,
    this.trainingPlanId,
    required this.configNumberOfRounds,
    required this.configRoundDurationSeconds,
    required this.configRestDurationSeconds,
    this.configName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['completed_at'] = Variable<DateTime>(completedAt);
    map['rounds_completed'] = Variable<int>(roundsCompleted);
    map['total_duration_seconds'] = Variable<int>(totalDurationSeconds);
    map['difficulty'] = Variable<int>(difficulty);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || trainingPlanId != null) {
      map['training_plan_id'] = Variable<String>(trainingPlanId);
    }
    map['config_number_of_rounds'] = Variable<int>(configNumberOfRounds);
    map['config_round_duration_seconds'] = Variable<int>(
      configRoundDurationSeconds,
    );
    map['config_rest_duration_seconds'] = Variable<int>(
      configRestDurationSeconds,
    );
    if (!nullToAbsent || configName != null) {
      map['config_name'] = Variable<String>(configName);
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: Value(id),
      completedAt: Value(completedAt),
      roundsCompleted: Value(roundsCompleted),
      totalDurationSeconds: Value(totalDurationSeconds),
      difficulty: Value(difficulty),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      trainingPlanId: trainingPlanId == null && nullToAbsent
          ? const Value.absent()
          : Value(trainingPlanId),
      configNumberOfRounds: Value(configNumberOfRounds),
      configRoundDurationSeconds: Value(configRoundDurationSeconds),
      configRestDurationSeconds: Value(configRestDurationSeconds),
      configName: configName == null && nullToAbsent
          ? const Value.absent()
          : Value(configName),
    );
  }

  factory Workout.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Workout(
      id: serializer.fromJson<String>(json['id']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      roundsCompleted: serializer.fromJson<int>(json['roundsCompleted']),
      totalDurationSeconds: serializer.fromJson<int>(
        json['totalDurationSeconds'],
      ),
      difficulty: serializer.fromJson<int>(json['difficulty']),
      notes: serializer.fromJson<String?>(json['notes']),
      trainingPlanId: serializer.fromJson<String?>(json['trainingPlanId']),
      configNumberOfRounds: serializer.fromJson<int>(
        json['configNumberOfRounds'],
      ),
      configRoundDurationSeconds: serializer.fromJson<int>(
        json['configRoundDurationSeconds'],
      ),
      configRestDurationSeconds: serializer.fromJson<int>(
        json['configRestDurationSeconds'],
      ),
      configName: serializer.fromJson<String?>(json['configName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'roundsCompleted': serializer.toJson<int>(roundsCompleted),
      'totalDurationSeconds': serializer.toJson<int>(totalDurationSeconds),
      'difficulty': serializer.toJson<int>(difficulty),
      'notes': serializer.toJson<String?>(notes),
      'trainingPlanId': serializer.toJson<String?>(trainingPlanId),
      'configNumberOfRounds': serializer.toJson<int>(configNumberOfRounds),
      'configRoundDurationSeconds': serializer.toJson<int>(
        configRoundDurationSeconds,
      ),
      'configRestDurationSeconds': serializer.toJson<int>(
        configRestDurationSeconds,
      ),
      'configName': serializer.toJson<String?>(configName),
    };
  }

  Workout copyWith({
    String? id,
    DateTime? completedAt,
    int? roundsCompleted,
    int? totalDurationSeconds,
    int? difficulty,
    Value<String?> notes = const Value.absent(),
    Value<String?> trainingPlanId = const Value.absent(),
    int? configNumberOfRounds,
    int? configRoundDurationSeconds,
    int? configRestDurationSeconds,
    Value<String?> configName = const Value.absent(),
  }) => Workout(
    id: id ?? this.id,
    completedAt: completedAt ?? this.completedAt,
    roundsCompleted: roundsCompleted ?? this.roundsCompleted,
    totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
    difficulty: difficulty ?? this.difficulty,
    notes: notes.present ? notes.value : this.notes,
    trainingPlanId: trainingPlanId.present
        ? trainingPlanId.value
        : this.trainingPlanId,
    configNumberOfRounds: configNumberOfRounds ?? this.configNumberOfRounds,
    configRoundDurationSeconds:
        configRoundDurationSeconds ?? this.configRoundDurationSeconds,
    configRestDurationSeconds:
        configRestDurationSeconds ?? this.configRestDurationSeconds,
    configName: configName.present ? configName.value : this.configName,
  );
  Workout copyWithCompanion(WorkoutsCompanion data) {
    return Workout(
      id: data.id.present ? data.id.value : this.id,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      roundsCompleted: data.roundsCompleted.present
          ? data.roundsCompleted.value
          : this.roundsCompleted,
      totalDurationSeconds: data.totalDurationSeconds.present
          ? data.totalDurationSeconds.value
          : this.totalDurationSeconds,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      notes: data.notes.present ? data.notes.value : this.notes,
      trainingPlanId: data.trainingPlanId.present
          ? data.trainingPlanId.value
          : this.trainingPlanId,
      configNumberOfRounds: data.configNumberOfRounds.present
          ? data.configNumberOfRounds.value
          : this.configNumberOfRounds,
      configRoundDurationSeconds: data.configRoundDurationSeconds.present
          ? data.configRoundDurationSeconds.value
          : this.configRoundDurationSeconds,
      configRestDurationSeconds: data.configRestDurationSeconds.present
          ? data.configRestDurationSeconds.value
          : this.configRestDurationSeconds,
      configName: data.configName.present
          ? data.configName.value
          : this.configName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Workout(')
          ..write('id: $id, ')
          ..write('completedAt: $completedAt, ')
          ..write('roundsCompleted: $roundsCompleted, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('difficulty: $difficulty, ')
          ..write('notes: $notes, ')
          ..write('trainingPlanId: $trainingPlanId, ')
          ..write('configNumberOfRounds: $configNumberOfRounds, ')
          ..write('configRoundDurationSeconds: $configRoundDurationSeconds, ')
          ..write('configRestDurationSeconds: $configRestDurationSeconds, ')
          ..write('configName: $configName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    completedAt,
    roundsCompleted,
    totalDurationSeconds,
    difficulty,
    notes,
    trainingPlanId,
    configNumberOfRounds,
    configRoundDurationSeconds,
    configRestDurationSeconds,
    configName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Workout &&
          other.id == this.id &&
          other.completedAt == this.completedAt &&
          other.roundsCompleted == this.roundsCompleted &&
          other.totalDurationSeconds == this.totalDurationSeconds &&
          other.difficulty == this.difficulty &&
          other.notes == this.notes &&
          other.trainingPlanId == this.trainingPlanId &&
          other.configNumberOfRounds == this.configNumberOfRounds &&
          other.configRoundDurationSeconds == this.configRoundDurationSeconds &&
          other.configRestDurationSeconds == this.configRestDurationSeconds &&
          other.configName == this.configName);
}

class WorkoutsCompanion extends UpdateCompanion<domain.Workout> {
  final Value<String> id;
  final Value<DateTime> completedAt;
  final Value<int> roundsCompleted;
  final Value<int> totalDurationSeconds;
  final Value<int> difficulty;
  final Value<String?> notes;
  final Value<String?> trainingPlanId;
  final Value<int> configNumberOfRounds;
  final Value<int> configRoundDurationSeconds;
  final Value<int> configRestDurationSeconds;
  final Value<String?> configName;
  final Value<int> rowid;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.roundsCompleted = const Value.absent(),
    this.totalDurationSeconds = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.notes = const Value.absent(),
    this.trainingPlanId = const Value.absent(),
    this.configNumberOfRounds = const Value.absent(),
    this.configRoundDurationSeconds = const Value.absent(),
    this.configRestDurationSeconds = const Value.absent(),
    this.configName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    required String id,
    required DateTime completedAt,
    required int roundsCompleted,
    required int totalDurationSeconds,
    required int difficulty,
    this.notes = const Value.absent(),
    this.trainingPlanId = const Value.absent(),
    required int configNumberOfRounds,
    required int configRoundDurationSeconds,
    required int configRestDurationSeconds,
    this.configName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       completedAt = Value(completedAt),
       roundsCompleted = Value(roundsCompleted),
       totalDurationSeconds = Value(totalDurationSeconds),
       difficulty = Value(difficulty),
       configNumberOfRounds = Value(configNumberOfRounds),
       configRoundDurationSeconds = Value(configRoundDurationSeconds),
       configRestDurationSeconds = Value(configRestDurationSeconds);
  static Insertable<domain.Workout> custom({
    Expression<String>? id,
    Expression<DateTime>? completedAt,
    Expression<int>? roundsCompleted,
    Expression<int>? totalDurationSeconds,
    Expression<int>? difficulty,
    Expression<String>? notes,
    Expression<String>? trainingPlanId,
    Expression<int>? configNumberOfRounds,
    Expression<int>? configRoundDurationSeconds,
    Expression<int>? configRestDurationSeconds,
    Expression<String>? configName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completedAt != null) 'completed_at': completedAt,
      if (roundsCompleted != null) 'rounds_completed': roundsCompleted,
      if (totalDurationSeconds != null)
        'total_duration_seconds': totalDurationSeconds,
      if (difficulty != null) 'difficulty': difficulty,
      if (notes != null) 'notes': notes,
      if (trainingPlanId != null) 'training_plan_id': trainingPlanId,
      if (configNumberOfRounds != null)
        'config_number_of_rounds': configNumberOfRounds,
      if (configRoundDurationSeconds != null)
        'config_round_duration_seconds': configRoundDurationSeconds,
      if (configRestDurationSeconds != null)
        'config_rest_duration_seconds': configRestDurationSeconds,
      if (configName != null) 'config_name': configName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? completedAt,
    Value<int>? roundsCompleted,
    Value<int>? totalDurationSeconds,
    Value<int>? difficulty,
    Value<String?>? notes,
    Value<String?>? trainingPlanId,
    Value<int>? configNumberOfRounds,
    Value<int>? configRoundDurationSeconds,
    Value<int>? configRestDurationSeconds,
    Value<String?>? configName,
    Value<int>? rowid,
  }) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      completedAt: completedAt ?? this.completedAt,
      roundsCompleted: roundsCompleted ?? this.roundsCompleted,
      totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
      difficulty: difficulty ?? this.difficulty,
      notes: notes ?? this.notes,
      trainingPlanId: trainingPlanId ?? this.trainingPlanId,
      configNumberOfRounds: configNumberOfRounds ?? this.configNumberOfRounds,
      configRoundDurationSeconds:
          configRoundDurationSeconds ?? this.configRoundDurationSeconds,
      configRestDurationSeconds:
          configRestDurationSeconds ?? this.configRestDurationSeconds,
      configName: configName ?? this.configName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (roundsCompleted.present) {
      map['rounds_completed'] = Variable<int>(roundsCompleted.value);
    }
    if (totalDurationSeconds.present) {
      map['total_duration_seconds'] = Variable<int>(totalDurationSeconds.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(difficulty.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (trainingPlanId.present) {
      map['training_plan_id'] = Variable<String>(trainingPlanId.value);
    }
    if (configNumberOfRounds.present) {
      map['config_number_of_rounds'] = Variable<int>(
        configNumberOfRounds.value,
      );
    }
    if (configRoundDurationSeconds.present) {
      map['config_round_duration_seconds'] = Variable<int>(
        configRoundDurationSeconds.value,
      );
    }
    if (configRestDurationSeconds.present) {
      map['config_rest_duration_seconds'] = Variable<int>(
        configRestDurationSeconds.value,
      );
    }
    if (configName.present) {
      map['config_name'] = Variable<String>(configName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutsCompanion(')
          ..write('id: $id, ')
          ..write('completedAt: $completedAt, ')
          ..write('roundsCompleted: $roundsCompleted, ')
          ..write('totalDurationSeconds: $totalDurationSeconds, ')
          ..write('difficulty: $difficulty, ')
          ..write('notes: $notes, ')
          ..write('trainingPlanId: $trainingPlanId, ')
          ..write('configNumberOfRounds: $configNumberOfRounds, ')
          ..write('configRoundDurationSeconds: $configRoundDurationSeconds, ')
          ..write('configRestDurationSeconds: $configRestDurationSeconds, ')
          ..write('configName: $configName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingPlansTable extends TrainingPlans
    with TableInfo<$TrainingPlansTable, TrainingPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUsedAtMeta = const VerificationMeta(
    'lastUsedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
    'last_used_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isTemplateMeta = const VerificationMeta(
    'isTemplate',
  );
  @override
  late final GeneratedColumn<bool> isTemplate = GeneratedColumn<bool>(
    'is_template',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_template" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    createdAt,
    lastUsedAt,
    isTemplate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingPlan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
        _lastUsedAtMeta,
        lastUsedAt.isAcceptableOrUnknown(
          data['last_used_at']!,
          _lastUsedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_template')) {
      context.handle(
        _isTemplateMeta,
        isTemplate.isAcceptableOrUnknown(data['is_template']!, _isTemplateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUsedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_used_at'],
      ),
      isTemplate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_template'],
      )!,
    );
  }

  @override
  $TrainingPlansTable createAlias(String alias) {
    return $TrainingPlansTable(attachedDatabase, alias);
  }
}

class TrainingPlan extends DataClass implements Insertable<TrainingPlan> {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime? lastUsedAt;
  final bool isTemplate;
  const TrainingPlan({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    this.lastUsedAt,
    required this.isTemplate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUsedAt != null) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    }
    map['is_template'] = Variable<bool>(isTemplate);
    return map;
  }

  TrainingPlansCompanion toCompanion(bool nullToAbsent) {
    return TrainingPlansCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      lastUsedAt: lastUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsedAt),
      isTemplate: Value(isTemplate),
    );
  }

  factory TrainingPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingPlan(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUsedAt: serializer.fromJson<DateTime?>(json['lastUsedAt']),
      isTemplate: serializer.fromJson<bool>(json['isTemplate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUsedAt': serializer.toJson<DateTime?>(lastUsedAt),
      'isTemplate': serializer.toJson<bool>(isTemplate),
    };
  }

  TrainingPlan copyWith({
    String? id,
    String? name,
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> lastUsedAt = const Value.absent(),
    bool? isTemplate,
  }) => TrainingPlan(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
    lastUsedAt: lastUsedAt.present ? lastUsedAt.value : this.lastUsedAt,
    isTemplate: isTemplate ?? this.isTemplate,
  );
  TrainingPlan copyWithCompanion(TrainingPlansCompanion data) {
    return TrainingPlan(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUsedAt: data.lastUsedAt.present
          ? data.lastUsedAt.value
          : this.lastUsedAt,
      isTemplate: data.isTemplate.present
          ? data.isTemplate.value
          : this.isTemplate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingPlan(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('isTemplate: $isTemplate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createdAt, lastUsedAt, isTemplate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingPlan &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.lastUsedAt == this.lastUsedAt &&
          other.isTemplate == this.isTemplate);
}

class TrainingPlansCompanion extends UpdateCompanion<TrainingPlan> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUsedAt;
  final Value<bool> isTemplate;
  final Value<int> rowid;
  const TrainingPlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.isTemplate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingPlansCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.lastUsedAt = const Value.absent(),
    this.isTemplate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<TrainingPlan> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUsedAt,
    Expression<bool>? isTemplate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (isTemplate != null) 'is_template': isTemplate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingPlansCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUsedAt,
    Value<bool>? isTemplate,
    Value<int>? rowid,
  }) {
    return TrainingPlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      isTemplate: isTemplate ?? this.isTemplate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (isTemplate.present) {
      map['is_template'] = Variable<bool>(isTemplate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingPlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('isTemplate: $isTemplate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingDaysTable extends TrainingDays
    with TableInfo<$TrainingDaysTable, TrainingDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayNumberMeta = const VerificationMeta(
    'dayNumber',
  );
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
    'day_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberOfRoundsMeta = const VerificationMeta(
    'numberOfRounds',
  );
  @override
  late final GeneratedColumn<int> numberOfRounds = GeneratedColumn<int>(
    'number_of_rounds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roundDurationSecondsMeta =
      const VerificationMeta('roundDurationSeconds');
  @override
  late final GeneratedColumn<int> roundDurationSeconds = GeneratedColumn<int>(
    'round_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _restDurationSecondsMeta =
      const VerificationMeta('restDurationSeconds');
  @override
  late final GeneratedColumn<int> restDurationSeconds = GeneratedColumn<int>(
    'rest_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    planId,
    name,
    dayNumber,
    numberOfRounds,
    roundDurationSeconds,
    restDurationSeconds,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('day_number')) {
      context.handle(
        _dayNumberMeta,
        dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('number_of_rounds')) {
      context.handle(
        _numberOfRoundsMeta,
        numberOfRounds.isAcceptableOrUnknown(
          data['number_of_rounds']!,
          _numberOfRoundsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberOfRoundsMeta);
    }
    if (data.containsKey('round_duration_seconds')) {
      context.handle(
        _roundDurationSecondsMeta,
        roundDurationSeconds.isAcceptableOrUnknown(
          data['round_duration_seconds']!,
          _roundDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_roundDurationSecondsMeta);
    }
    if (data.containsKey('rest_duration_seconds')) {
      context.handle(
        _restDurationSecondsMeta,
        restDurationSeconds.isAcceptableOrUnknown(
          data['rest_duration_seconds']!,
          _restDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_restDurationSecondsMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingDay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dayNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_number'],
      )!,
      numberOfRounds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_rounds'],
      )!,
      roundDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round_duration_seconds'],
      )!,
      restDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_duration_seconds'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $TrainingDaysTable createAlias(String alias) {
    return $TrainingDaysTable(attachedDatabase, alias);
  }
}

class TrainingDay extends DataClass implements Insertable<TrainingDay> {
  final String id;
  final String planId;
  final String name;
  final int dayNumber;
  final int numberOfRounds;
  final int roundDurationSeconds;
  final int restDurationSeconds;
  final String? notes;
  const TrainingDay({
    required this.id,
    required this.planId,
    required this.name,
    required this.dayNumber,
    required this.numberOfRounds,
    required this.roundDurationSeconds,
    required this.restDurationSeconds,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plan_id'] = Variable<String>(planId);
    map['name'] = Variable<String>(name);
    map['day_number'] = Variable<int>(dayNumber);
    map['number_of_rounds'] = Variable<int>(numberOfRounds);
    map['round_duration_seconds'] = Variable<int>(roundDurationSeconds);
    map['rest_duration_seconds'] = Variable<int>(restDurationSeconds);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  TrainingDaysCompanion toCompanion(bool nullToAbsent) {
    return TrainingDaysCompanion(
      id: Value(id),
      planId: Value(planId),
      name: Value(name),
      dayNumber: Value(dayNumber),
      numberOfRounds: Value(numberOfRounds),
      roundDurationSeconds: Value(roundDurationSeconds),
      restDurationSeconds: Value(restDurationSeconds),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory TrainingDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingDay(
      id: serializer.fromJson<String>(json['id']),
      planId: serializer.fromJson<String>(json['planId']),
      name: serializer.fromJson<String>(json['name']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      numberOfRounds: serializer.fromJson<int>(json['numberOfRounds']),
      roundDurationSeconds: serializer.fromJson<int>(
        json['roundDurationSeconds'],
      ),
      restDurationSeconds: serializer.fromJson<int>(
        json['restDurationSeconds'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'planId': serializer.toJson<String>(planId),
      'name': serializer.toJson<String>(name),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'numberOfRounds': serializer.toJson<int>(numberOfRounds),
      'roundDurationSeconds': serializer.toJson<int>(roundDurationSeconds),
      'restDurationSeconds': serializer.toJson<int>(restDurationSeconds),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  TrainingDay copyWith({
    String? id,
    String? planId,
    String? name,
    int? dayNumber,
    int? numberOfRounds,
    int? roundDurationSeconds,
    int? restDurationSeconds,
    Value<String?> notes = const Value.absent(),
  }) => TrainingDay(
    id: id ?? this.id,
    planId: planId ?? this.planId,
    name: name ?? this.name,
    dayNumber: dayNumber ?? this.dayNumber,
    numberOfRounds: numberOfRounds ?? this.numberOfRounds,
    roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
    restDurationSeconds: restDurationSeconds ?? this.restDurationSeconds,
    notes: notes.present ? notes.value : this.notes,
  );
  TrainingDay copyWithCompanion(TrainingDaysCompanion data) {
    return TrainingDay(
      id: data.id.present ? data.id.value : this.id,
      planId: data.planId.present ? data.planId.value : this.planId,
      name: data.name.present ? data.name.value : this.name,
      dayNumber: data.dayNumber.present ? data.dayNumber.value : this.dayNumber,
      numberOfRounds: data.numberOfRounds.present
          ? data.numberOfRounds.value
          : this.numberOfRounds,
      roundDurationSeconds: data.roundDurationSeconds.present
          ? data.roundDurationSeconds.value
          : this.roundDurationSeconds,
      restDurationSeconds: data.restDurationSeconds.present
          ? data.restDurationSeconds.value
          : this.restDurationSeconds,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingDay(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('name: $name, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('numberOfRounds: $numberOfRounds, ')
          ..write('roundDurationSeconds: $roundDurationSeconds, ')
          ..write('restDurationSeconds: $restDurationSeconds, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    planId,
    name,
    dayNumber,
    numberOfRounds,
    roundDurationSeconds,
    restDurationSeconds,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingDay &&
          other.id == this.id &&
          other.planId == this.planId &&
          other.name == this.name &&
          other.dayNumber == this.dayNumber &&
          other.numberOfRounds == this.numberOfRounds &&
          other.roundDurationSeconds == this.roundDurationSeconds &&
          other.restDurationSeconds == this.restDurationSeconds &&
          other.notes == this.notes);
}

class TrainingDaysCompanion extends UpdateCompanion<TrainingDay> {
  final Value<String> id;
  final Value<String> planId;
  final Value<String> name;
  final Value<int> dayNumber;
  final Value<int> numberOfRounds;
  final Value<int> roundDurationSeconds;
  final Value<int> restDurationSeconds;
  final Value<String?> notes;
  final Value<int> rowid;
  const TrainingDaysCompanion({
    this.id = const Value.absent(),
    this.planId = const Value.absent(),
    this.name = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.numberOfRounds = const Value.absent(),
    this.roundDurationSeconds = const Value.absent(),
    this.restDurationSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingDaysCompanion.insert({
    required String id,
    required String planId,
    required String name,
    required int dayNumber,
    required int numberOfRounds,
    required int roundDurationSeconds,
    required int restDurationSeconds,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       planId = Value(planId),
       name = Value(name),
       dayNumber = Value(dayNumber),
       numberOfRounds = Value(numberOfRounds),
       roundDurationSeconds = Value(roundDurationSeconds),
       restDurationSeconds = Value(restDurationSeconds);
  static Insertable<TrainingDay> custom({
    Expression<String>? id,
    Expression<String>? planId,
    Expression<String>? name,
    Expression<int>? dayNumber,
    Expression<int>? numberOfRounds,
    Expression<int>? roundDurationSeconds,
    Expression<int>? restDurationSeconds,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (planId != null) 'plan_id': planId,
      if (name != null) 'name': name,
      if (dayNumber != null) 'day_number': dayNumber,
      if (numberOfRounds != null) 'number_of_rounds': numberOfRounds,
      if (roundDurationSeconds != null)
        'round_duration_seconds': roundDurationSeconds,
      if (restDurationSeconds != null)
        'rest_duration_seconds': restDurationSeconds,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingDaysCompanion copyWith({
    Value<String>? id,
    Value<String>? planId,
    Value<String>? name,
    Value<int>? dayNumber,
    Value<int>? numberOfRounds,
    Value<int>? roundDurationSeconds,
    Value<int>? restDurationSeconds,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return TrainingDaysCompanion(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      name: name ?? this.name,
      dayNumber: dayNumber ?? this.dayNumber,
      numberOfRounds: numberOfRounds ?? this.numberOfRounds,
      roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
      restDurationSeconds: restDurationSeconds ?? this.restDurationSeconds,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (numberOfRounds.present) {
      map['number_of_rounds'] = Variable<int>(numberOfRounds.value);
    }
    if (roundDurationSeconds.present) {
      map['round_duration_seconds'] = Variable<int>(roundDurationSeconds.value);
    }
    if (restDurationSeconds.present) {
      map['rest_duration_seconds'] = Variable<int>(restDurationSeconds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingDaysCompanion(')
          ..write('id: $id, ')
          ..write('planId: $planId, ')
          ..write('name: $name, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('numberOfRounds: $numberOfRounds, ')
          ..write('roundDurationSeconds: $roundDurationSeconds, ')
          ..write('restDurationSeconds: $restDurationSeconds, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkoutsTable workouts = $WorkoutsTable(this);
  late final $TrainingPlansTable trainingPlans = $TrainingPlansTable(this);
  late final $TrainingDaysTable trainingDays = $TrainingDaysTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    workouts,
    trainingPlans,
    trainingDays,
  ];
}

typedef $$WorkoutsTableCreateCompanionBuilder =
    WorkoutsCompanion Function({
      required String id,
      required DateTime completedAt,
      required int roundsCompleted,
      required int totalDurationSeconds,
      required int difficulty,
      Value<String?> notes,
      Value<String?> trainingPlanId,
      required int configNumberOfRounds,
      required int configRoundDurationSeconds,
      required int configRestDurationSeconds,
      Value<String?> configName,
      Value<int> rowid,
    });
typedef $$WorkoutsTableUpdateCompanionBuilder =
    WorkoutsCompanion Function({
      Value<String> id,
      Value<DateTime> completedAt,
      Value<int> roundsCompleted,
      Value<int> totalDurationSeconds,
      Value<int> difficulty,
      Value<String?> notes,
      Value<String?> trainingPlanId,
      Value<int> configNumberOfRounds,
      Value<int> configRoundDurationSeconds,
      Value<int> configRestDurationSeconds,
      Value<String?> configName,
      Value<int> rowid,
    });

class $$WorkoutsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roundsCompleted => $composableBuilder(
    column: $table.roundsCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trainingPlanId => $composableBuilder(
    column: $table.trainingPlanId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get configNumberOfRounds => $composableBuilder(
    column: $table.configNumberOfRounds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get configRoundDurationSeconds => $composableBuilder(
    column: $table.configRoundDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get configRestDurationSeconds => $composableBuilder(
    column: $table.configRestDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get configName => $composableBuilder(
    column: $table.configName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roundsCompleted => $composableBuilder(
    column: $table.roundsCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trainingPlanId => $composableBuilder(
    column: $table.trainingPlanId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get configNumberOfRounds => $composableBuilder(
    column: $table.configNumberOfRounds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get configRoundDurationSeconds => $composableBuilder(
    column: $table.configRoundDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get configRestDurationSeconds => $composableBuilder(
    column: $table.configRestDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get configName => $composableBuilder(
    column: $table.configName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutsTable> {
  $$WorkoutsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get roundsCompleted => $composableBuilder(
    column: $table.roundsCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalDurationSeconds => $composableBuilder(
    column: $table.totalDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get trainingPlanId => $composableBuilder(
    column: $table.trainingPlanId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get configNumberOfRounds => $composableBuilder(
    column: $table.configNumberOfRounds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get configRoundDurationSeconds => $composableBuilder(
    column: $table.configRoundDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get configRestDurationSeconds => $composableBuilder(
    column: $table.configRestDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get configName => $composableBuilder(
    column: $table.configName,
    builder: (column) => column,
  );
}

class $$WorkoutsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutsTable,
          domain.Workout,
          $$WorkoutsTableFilterComposer,
          $$WorkoutsTableOrderingComposer,
          $$WorkoutsTableAnnotationComposer,
          $$WorkoutsTableCreateCompanionBuilder,
          $$WorkoutsTableUpdateCompanionBuilder,
          (
            domain.Workout,
            BaseReferences<_$AppDatabase, $WorkoutsTable, domain.Workout>,
          ),
          domain.Workout,
          PrefetchHooks Function()
        > {
  $$WorkoutsTableTableManager(_$AppDatabase db, $WorkoutsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int> roundsCompleted = const Value.absent(),
                Value<int> totalDurationSeconds = const Value.absent(),
                Value<int> difficulty = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> trainingPlanId = const Value.absent(),
                Value<int> configNumberOfRounds = const Value.absent(),
                Value<int> configRoundDurationSeconds = const Value.absent(),
                Value<int> configRestDurationSeconds = const Value.absent(),
                Value<String?> configName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutsCompanion(
                id: id,
                completedAt: completedAt,
                roundsCompleted: roundsCompleted,
                totalDurationSeconds: totalDurationSeconds,
                difficulty: difficulty,
                notes: notes,
                trainingPlanId: trainingPlanId,
                configNumberOfRounds: configNumberOfRounds,
                configRoundDurationSeconds: configRoundDurationSeconds,
                configRestDurationSeconds: configRestDurationSeconds,
                configName: configName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime completedAt,
                required int roundsCompleted,
                required int totalDurationSeconds,
                required int difficulty,
                Value<String?> notes = const Value.absent(),
                Value<String?> trainingPlanId = const Value.absent(),
                required int configNumberOfRounds,
                required int configRoundDurationSeconds,
                required int configRestDurationSeconds,
                Value<String?> configName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutsCompanion.insert(
                id: id,
                completedAt: completedAt,
                roundsCompleted: roundsCompleted,
                totalDurationSeconds: totalDurationSeconds,
                difficulty: difficulty,
                notes: notes,
                trainingPlanId: trainingPlanId,
                configNumberOfRounds: configNumberOfRounds,
                configRoundDurationSeconds: configRoundDurationSeconds,
                configRestDurationSeconds: configRestDurationSeconds,
                configName: configName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutsTable,
      domain.Workout,
      $$WorkoutsTableFilterComposer,
      $$WorkoutsTableOrderingComposer,
      $$WorkoutsTableAnnotationComposer,
      $$WorkoutsTableCreateCompanionBuilder,
      $$WorkoutsTableUpdateCompanionBuilder,
      (
        domain.Workout,
        BaseReferences<_$AppDatabase, $WorkoutsTable, domain.Workout>,
      ),
      domain.Workout,
      PrefetchHooks Function()
    >;
typedef $$TrainingPlansTableCreateCompanionBuilder =
    TrainingPlansCompanion Function({
      required String id,
      required String name,
      Value<String?> description,
      required DateTime createdAt,
      Value<DateTime?> lastUsedAt,
      Value<bool> isTemplate,
      Value<int> rowid,
    });
typedef $$TrainingPlansTableUpdateCompanionBuilder =
    TrainingPlansCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> description,
      Value<DateTime> createdAt,
      Value<DateTime?> lastUsedAt,
      Value<bool> isTemplate,
      Value<int> rowid,
    });

class $$TrainingPlansTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingPlansTable> {
  $$TrainingPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTemplate => $composableBuilder(
    column: $table.isTemplate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrainingPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingPlansTable> {
  $$TrainingPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTemplate => $composableBuilder(
    column: $table.isTemplate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrainingPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingPlansTable> {
  $$TrainingPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
    column: $table.lastUsedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isTemplate => $composableBuilder(
    column: $table.isTemplate,
    builder: (column) => column,
  );
}

class $$TrainingPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainingPlansTable,
          TrainingPlan,
          $$TrainingPlansTableFilterComposer,
          $$TrainingPlansTableOrderingComposer,
          $$TrainingPlansTableAnnotationComposer,
          $$TrainingPlansTableCreateCompanionBuilder,
          $$TrainingPlansTableUpdateCompanionBuilder,
          (
            TrainingPlan,
            BaseReferences<_$AppDatabase, $TrainingPlansTable, TrainingPlan>,
          ),
          TrainingPlan,
          PrefetchHooks Function()
        > {
  $$TrainingPlansTableTableManager(_$AppDatabase db, $TrainingPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUsedAt = const Value.absent(),
                Value<bool> isTemplate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingPlansCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                lastUsedAt: lastUsedAt,
                isTemplate: isTemplate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> description = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> lastUsedAt = const Value.absent(),
                Value<bool> isTemplate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingPlansCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                lastUsedAt: lastUsedAt,
                isTemplate: isTemplate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrainingPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainingPlansTable,
      TrainingPlan,
      $$TrainingPlansTableFilterComposer,
      $$TrainingPlansTableOrderingComposer,
      $$TrainingPlansTableAnnotationComposer,
      $$TrainingPlansTableCreateCompanionBuilder,
      $$TrainingPlansTableUpdateCompanionBuilder,
      (
        TrainingPlan,
        BaseReferences<_$AppDatabase, $TrainingPlansTable, TrainingPlan>,
      ),
      TrainingPlan,
      PrefetchHooks Function()
    >;
typedef $$TrainingDaysTableCreateCompanionBuilder =
    TrainingDaysCompanion Function({
      required String id,
      required String planId,
      required String name,
      required int dayNumber,
      required int numberOfRounds,
      required int roundDurationSeconds,
      required int restDurationSeconds,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$TrainingDaysTableUpdateCompanionBuilder =
    TrainingDaysCompanion Function({
      Value<String> id,
      Value<String> planId,
      Value<String> name,
      Value<int> dayNumber,
      Value<int> numberOfRounds,
      Value<int> roundDurationSeconds,
      Value<int> restDurationSeconds,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$TrainingDaysTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingDaysTable> {
  $$TrainingDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayNumber => $composableBuilder(
    column: $table.dayNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfRounds => $composableBuilder(
    column: $table.numberOfRounds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roundDurationSeconds => $composableBuilder(
    column: $table.roundDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restDurationSeconds => $composableBuilder(
    column: $table.restDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrainingDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingDaysTable> {
  $$TrainingDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayNumber => $composableBuilder(
    column: $table.dayNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfRounds => $composableBuilder(
    column: $table.numberOfRounds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roundDurationSeconds => $composableBuilder(
    column: $table.roundDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restDurationSeconds => $composableBuilder(
    column: $table.restDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrainingDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingDaysTable> {
  $$TrainingDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<int> get numberOfRounds => $composableBuilder(
    column: $table.numberOfRounds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get roundDurationSeconds => $composableBuilder(
    column: $table.roundDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get restDurationSeconds => $composableBuilder(
    column: $table.restDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$TrainingDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainingDaysTable,
          TrainingDay,
          $$TrainingDaysTableFilterComposer,
          $$TrainingDaysTableOrderingComposer,
          $$TrainingDaysTableAnnotationComposer,
          $$TrainingDaysTableCreateCompanionBuilder,
          $$TrainingDaysTableUpdateCompanionBuilder,
          (
            TrainingDay,
            BaseReferences<_$AppDatabase, $TrainingDaysTable, TrainingDay>,
          ),
          TrainingDay,
          PrefetchHooks Function()
        > {
  $$TrainingDaysTableTableManager(_$AppDatabase db, $TrainingDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> planId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> dayNumber = const Value.absent(),
                Value<int> numberOfRounds = const Value.absent(),
                Value<int> roundDurationSeconds = const Value.absent(),
                Value<int> restDurationSeconds = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingDaysCompanion(
                id: id,
                planId: planId,
                name: name,
                dayNumber: dayNumber,
                numberOfRounds: numberOfRounds,
                roundDurationSeconds: roundDurationSeconds,
                restDurationSeconds: restDurationSeconds,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String planId,
                required String name,
                required int dayNumber,
                required int numberOfRounds,
                required int roundDurationSeconds,
                required int restDurationSeconds,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TrainingDaysCompanion.insert(
                id: id,
                planId: planId,
                name: name,
                dayNumber: dayNumber,
                numberOfRounds: numberOfRounds,
                roundDurationSeconds: roundDurationSeconds,
                restDurationSeconds: restDurationSeconds,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrainingDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainingDaysTable,
      TrainingDay,
      $$TrainingDaysTableFilterComposer,
      $$TrainingDaysTableOrderingComposer,
      $$TrainingDaysTableAnnotationComposer,
      $$TrainingDaysTableCreateCompanionBuilder,
      $$TrainingDaysTableUpdateCompanionBuilder,
      (
        TrainingDay,
        BaseReferences<_$AppDatabase, $TrainingDaysTable, TrainingDay>,
      ),
      TrainingDay,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkoutsTableTableManager get workouts =>
      $$WorkoutsTableTableManager(_db, _db.workouts);
  $$TrainingPlansTableTableManager get trainingPlans =>
      $$TrainingPlansTableTableManager(_db, _db.trainingPlans);
  $$TrainingDaysTableTableManager get trainingDays =>
      $$TrainingDaysTableTableManager(_db, _db.trainingDays);
}
