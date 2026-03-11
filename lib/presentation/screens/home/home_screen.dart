import 'package:fight_log/app/theme.dart';
import 'package:fight_log/domain/entities/round_config.dart';
import 'package:fight_log/presentation/providers/workout_provider.dart';
import 'package:fight_log/presentation/screens/home/widgets/quick_start_button.dart';
import 'package:fight_log/presentation/screens/home/widgets/stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Home Dashboard Screen
///
/// ASCII Wireframe:
/// ┌─────────────────────────┐
/// │    FightLog  💪         │
/// ├─────────────────────────┤
/// │                         │
/// │  [Quick Start Timer]    │
/// │                         │
/// ├─────────────────────────┤
/// │  This Week:             │
/// │  ┌────────┬────────┐   │
/// │  │ Rounds │ Time   │   │
/// │  │   24   │ 1h 30m │   │
/// │  └────────┴────────┘   │
/// │  Streak: 🔥 5 days     │
/// ├─────────────────────────┤
/// │  Recent Workouts:       │
/// │  • Today - 8 rounds     │
/// │  • Yesterday - 10 rds   │
/// └─────────────────────────┘
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roundsAsync = ref.watch(roundsThisWeekProvider);
    final timeAsync = ref.watch(timeThisWeekProvider);
    final streakAsync = ref.watch(currentStreakProvider);
    final recentWorkoutsAsync = ref.watch(allWorkoutsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('FightLog'),
            const SizedBox(width: 8),
            Text(
              '🥊',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome message
              Text(
                'Ready to train?',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Start a workout or check your progress',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Quick Start Button
              QuickStartButton(
                onPressed: () {
                  // Default quick start config
                  final config = RoundConfig(
                    id: 'quick-start',
                    numberOfRounds: 3,
                    roundDurationSeconds: 180,
                    restDurationSeconds: 60,
                    name: 'Quick Start',
                  );
                  context.pushNamed('timer', extra: config);
                },
              ),
              const SizedBox(height: 32),

              // This Week Stats
              Text(
                'This Week',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      title: 'Rounds',
                      value: roundsAsync.when(
                        data: (rounds) => rounds.toString(),
                        loading: () => '-',
                        error: (_, __) => '0',
                      ),
                      icon: Icons.fitness_center,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatsCard(
                      title: 'Time',
                      value: timeAsync.when(
                        data: (seconds) {
                          final hours = seconds ~/ 3600;
                          final minutes = (seconds % 3600) ~/ 60;
                          if (hours > 0) {
                            return '${hours}h ${minutes}m';
                          }
                          return '${minutes}m';
                        },
                        loading: () => '-',
                        error: (_, __) => '0m',
                      ),
                      icon: Icons.timer,
                      color: AppTheme.accentColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Streak
              StatsCard(
                title: 'Current Streak',
                value: streakAsync.when(
                  data: (streak) => streak > 0 ? '🔥 $streak days' : 'Start today!',
                  loading: () => '-',
                  error: (_, __) => '0 days',
                ),
                icon: Icons.local_fire_department,
                color: AppTheme.secondaryColor,
                fullWidth: true,
              ),
              const SizedBox(height: 32),

              // Recent Workouts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Workouts',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () => context.goNamed('history'),
                    child: const Text('See All'),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              recentWorkoutsAsync.when(
                data: (workouts) {
                  if (workouts.isEmpty) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.fitness_center,
                              size: 48,
                              color: AppTheme.textSecondary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No workouts yet',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppTheme.textSecondary,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tap Quick Start to begin!',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.textTertiary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final recentWorkouts = workouts.take(3).toList();
                  return Column(
                    children: recentWorkouts.map((workout) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                            child: const Icon(
                              Icons.fitness_center,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          title: Text(
                            '${workout.roundsCompleted} rounds',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            '${workout.formattedDate} • ${workout.formattedDuration}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _getDifficultyColor(workout.difficulty)
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              workout.difficulty.toString(),
                              style: TextStyle(
                                color: _getDifficultyColor(workout.difficulty),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onTap: () {
                            context.pushNamed(
                              'workout-detail',
                              pathParameters: {'id': workout.id},
                              extra: workout,
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => const Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text('Error loading workouts'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(int difficulty) {
    if (difficulty <= 3) return AppTheme.success;
    if (difficulty <= 7) return AppTheme.warning;
    return AppTheme.error;
  }
}
