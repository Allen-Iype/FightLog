// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allWorkoutsHash() => r'e912907c230a9ec611c4bfc1130c7ccb1335cb6d';

/// Provides a stream of all workouts
///
/// Copied from [allWorkouts].
@ProviderFor(allWorkouts)
final allWorkoutsProvider = AutoDisposeStreamProvider<List<Workout>>.internal(
  allWorkouts,
  name: r'allWorkoutsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allWorkoutsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllWorkoutsRef = AutoDisposeStreamProviderRef<List<Workout>>;
String _$workoutsInRangeHash() => r'ad5e99d00fc12384f05847368fd325b4ec814d97';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provides a stream of workouts in a date range
///
/// Copied from [workoutsInRange].
@ProviderFor(workoutsInRange)
const workoutsInRangeProvider = WorkoutsInRangeFamily();

/// Provides a stream of workouts in a date range
///
/// Copied from [workoutsInRange].
class WorkoutsInRangeFamily extends Family<AsyncValue<List<Workout>>> {
  /// Provides a stream of workouts in a date range
  ///
  /// Copied from [workoutsInRange].
  const WorkoutsInRangeFamily();

  /// Provides a stream of workouts in a date range
  ///
  /// Copied from [workoutsInRange].
  WorkoutsInRangeProvider call(DateTime start, DateTime end) {
    return WorkoutsInRangeProvider(start, end);
  }

  @override
  WorkoutsInRangeProvider getProviderOverride(
    covariant WorkoutsInRangeProvider provider,
  ) {
    return call(provider.start, provider.end);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutsInRangeProvider';
}

/// Provides a stream of workouts in a date range
///
/// Copied from [workoutsInRange].
class WorkoutsInRangeProvider extends AutoDisposeStreamProvider<List<Workout>> {
  /// Provides a stream of workouts in a date range
  ///
  /// Copied from [workoutsInRange].
  WorkoutsInRangeProvider(DateTime start, DateTime end)
    : this._internal(
        (ref) => workoutsInRange(ref as WorkoutsInRangeRef, start, end),
        from: workoutsInRangeProvider,
        name: r'workoutsInRangeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workoutsInRangeHash,
        dependencies: WorkoutsInRangeFamily._dependencies,
        allTransitiveDependencies:
            WorkoutsInRangeFamily._allTransitiveDependencies,
        start: start,
        end: end,
      );

  WorkoutsInRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.start,
    required this.end,
  }) : super.internal();

  final DateTime start;
  final DateTime end;

  @override
  Override overrideWith(
    Stream<List<Workout>> Function(WorkoutsInRangeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkoutsInRangeProvider._internal(
        (ref) => create(ref as WorkoutsInRangeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        start: start,
        end: end,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Workout>> createElement() {
    return _WorkoutsInRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutsInRangeProvider &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, start.hashCode);
    hash = _SystemHash.combine(hash, end.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkoutsInRangeRef on AutoDisposeStreamProviderRef<List<Workout>> {
  /// The parameter `start` of this provider.
  DateTime get start;

  /// The parameter `end` of this provider.
  DateTime get end;
}

class _WorkoutsInRangeProviderElement
    extends AutoDisposeStreamProviderElement<List<Workout>>
    with WorkoutsInRangeRef {
  _WorkoutsInRangeProviderElement(super.provider);

  @override
  DateTime get start => (origin as WorkoutsInRangeProvider).start;
  @override
  DateTime get end => (origin as WorkoutsInRangeProvider).end;
}

String _$weeklyStatsHash() => r'6d09a0fc05b21d46e7ce65ffa72bf936631e292b';

/// Provides workout statistics for the current week
///
/// Copied from [weeklyStats].
@ProviderFor(weeklyStats)
final weeklyStatsProvider = AutoDisposeFutureProvider<WorkoutStats>.internal(
  weeklyStats,
  name: r'weeklyStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weeklyStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeeklyStatsRef = AutoDisposeFutureProviderRef<WorkoutStats>;
String _$monthlyStatsHash() => r'b63a849ce00fa4a8924db867d0a9d2b3cbe6e7e2';

/// Provides workout statistics for the current month
///
/// Copied from [monthlyStats].
@ProviderFor(monthlyStats)
final monthlyStatsProvider = AutoDisposeFutureProvider<WorkoutStats>.internal(
  monthlyStats,
  name: r'monthlyStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$monthlyStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MonthlyStatsRef = AutoDisposeFutureProviderRef<WorkoutStats>;
String _$roundsThisWeekHash() => r'54974b8c61e64b895857c42f5748af274388bcaa';

/// Provides total rounds this week
///
/// Copied from [roundsThisWeek].
@ProviderFor(roundsThisWeek)
final roundsThisWeekProvider = AutoDisposeFutureProvider<int>.internal(
  roundsThisWeek,
  name: r'roundsThisWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$roundsThisWeekHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RoundsThisWeekRef = AutoDisposeFutureProviderRef<int>;
String _$timeThisWeekHash() => r'15336d8c00099078e8e67f99c9f842981a82d755';

/// Provides total time this week (in seconds)
///
/// Copied from [timeThisWeek].
@ProviderFor(timeThisWeek)
final timeThisWeekProvider = AutoDisposeFutureProvider<int>.internal(
  timeThisWeek,
  name: r'timeThisWeekProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$timeThisWeekHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TimeThisWeekRef = AutoDisposeFutureProviderRef<int>;
String _$currentStreakHash() => r'aa9e47fa73d65f6127fb6be7da2bf5042afa6b82';

/// Provides current training streak
///
/// Copied from [currentStreak].
@ProviderFor(currentStreak)
final currentStreakProvider = AutoDisposeFutureProvider<int>.internal(
  currentStreak,
  name: r'currentStreakProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentStreakHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentStreakRef = AutoDisposeFutureProviderRef<int>;
String _$workoutActionsHash() => r'037e5338bb7bd799a8d639467e568c3433fc1853';

/// Provides actions for workout operations
///
/// Copied from [WorkoutActions].
@ProviderFor(WorkoutActions)
final workoutActionsProvider =
    AutoDisposeNotifierProvider<WorkoutActions, void>.internal(
      WorkoutActions.new,
      name: r'workoutActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$workoutActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WorkoutActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
