import 'package:fight_log/app/theme.dart';
import 'package:fight_log/domain/repositories/workout_repository.dart';
import 'package:fight_log/presentation/providers/workout_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stats & Charts Screen
class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyStatsAsync = ref.watch(weeklyStatsProvider);
    final monthlyStatsAsync = ref.watch(monthlyStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Weekly Stats
            Text(
              'This Week',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            weeklyStatsAsync.when(
              data: (stats) => _WeeklyStatsCard(stats: stats),
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(48.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (_, __) => const Card(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text('Error loading stats'),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Monthly Stats
            Text(
              'This Month',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            monthlyStatsAsync.when(
              data: (stats) => _MonthlyStatsCard(stats: stats),
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(48.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (_, __) => const Card(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text('Error loading stats'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyStatsCard extends StatelessWidget {
  final WorkoutStats stats;

  const _WeeklyStatsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  label: 'Workouts',
                  value: stats.totalWorkouts.toString(),
                  icon: Icons.fitness_center,
                ),
                _StatItem(
                  label: 'Rounds',
                  value: stats.totalRounds.toString(),
                  icon: Icons.sports_mma,
                ),
                _StatItem(
                  label: 'Time',
                  value: stats.formattedTotalTime,
                  icon: Icons.timer,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Bar chart
            if (stats.roundsPerDay.isNotEmpty) ...[
              Text(
                'Rounds per Day',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: (stats.roundsPerDay.values.fold<int>(
                                0, (max, val) => val > max ? val : max) +
                            5)
                        .toDouble(),
                    barGroups: _buildBarGroups(stats.roundsPerDay),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                            if (value.toInt() >= 0 && value.toInt() < days.length) {
                              return Text(
                                days[value.toInt()],
                                style: const TextStyle(fontSize: 12),
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ] else
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: Text('No data yet. Complete a workout to see stats!'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(Map<DateTime, int> data) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    final groups = <BarChartGroupData>[];
    for (int i = 0; i < 7; i++) {
      final date = DateTime(
        startOfWeek.year,
        startOfWeek.month,
        startOfWeek.day + i,
      );
      final rounds = data[date] ?? 0;

      groups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: rounds.toDouble(),
              color: AppTheme.primaryColor,
              width: 16,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            ),
          ],
        ),
      );
    }
    return groups;
  }
}

class _MonthlyStatsCard extends StatelessWidget {
  final WorkoutStats stats;

  const _MonthlyStatsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(
                  label: 'Workouts',
                  value: stats.totalWorkouts.toString(),
                  icon: Icons.fitness_center,
                ),
                _StatItem(
                  label: 'Rounds',
                  value: stats.totalRounds.toString(),
                  icon: Icons.sports_mma,
                ),
                _StatItem(
                  label: 'Time',
                  value: stats.formattedTotalTime,
                  icon: Icons.timer,
                ),
              ],
            ),
            if (stats.averageDifficulty > 0) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.trending_up, color: AppTheme.accentColor),
                  const SizedBox(width: 8),
                  Text(
                    'Average Difficulty: ${stats.averageDifficulty.toStringAsFixed(1)}/10',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryColor),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
        ),
      ],
    );
  }
}
