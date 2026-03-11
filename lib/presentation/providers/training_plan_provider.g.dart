// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allTrainingPlansHash() => r'f033465e9be908d605486b9278f8ba357522cd16';

/// Provides a stream of all training plans
///
/// Copied from [allTrainingPlans].
@ProviderFor(allTrainingPlans)
final allTrainingPlansProvider =
    AutoDisposeStreamProvider<List<TrainingPlan>>.internal(
      allTrainingPlans,
      name: r'allTrainingPlansProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allTrainingPlansHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllTrainingPlansRef = AutoDisposeStreamProviderRef<List<TrainingPlan>>;
String _$templatePlansHash() => r'023b9354ab4a936c2f69a2603944af583e3a5fc2';

/// Provides a stream of template training plans
///
/// Copied from [templatePlans].
@ProviderFor(templatePlans)
final templatePlansProvider =
    AutoDisposeStreamProvider<List<TrainingPlan>>.internal(
      templatePlans,
      name: r'templatePlansProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$templatePlansHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TemplatePlansRef = AutoDisposeStreamProviderRef<List<TrainingPlan>>;
String _$trainingPlanActionsHash() =>
    r'9249b8c3d60565a71dabc940828981c58aa0a9e1';

/// Provides actions for training plan operations
///
/// Copied from [TrainingPlanActions].
@ProviderFor(TrainingPlanActions)
final trainingPlanActionsProvider =
    AutoDisposeNotifierProvider<TrainingPlanActions, void>.internal(
      TrainingPlanActions.new,
      name: r'trainingPlanActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$trainingPlanActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TrainingPlanActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
