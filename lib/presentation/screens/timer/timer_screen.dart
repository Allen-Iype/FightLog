import 'package:fight_log/app/theme.dart';
import 'package:fight_log/domain/entities/round_config.dart';
import 'package:fight_log/domain/entities/workout.dart';
import 'package:fight_log/presentation/providers/timer_provider.dart';
import 'package:fight_log/presentation/providers/workout_provider.dart';
import 'package:fight_log/presentation/screens/timer/widgets/countdown_circle.dart';
import 'package:fight_log/presentation/screens/timer/widgets/round_display.dart';
import 'package:fight_log/presentation/screens/timer/widgets/timer_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Timer Screen - Core workout feature
///
/// ASCII Wireframe:
/// ┌─────────────────────────┐
/// │    ← Timer     ⚙        │
/// ├─────────────────────────┤
/// │                         │
/// │   Round 2 / 3           │
/// │                         │
/// │      ╭─────────╮        │
/// │      │         │        │
/// │      │  2:30   │        │
/// │      │         │        │
/// │      ╰─────────╯        │
/// │                         │
/// │   [Stop] [▶] [Skip]    │
/// │                         │
/// └─────────────────────────┘
class TimerScreen extends ConsumerStatefulWidget {
  final RoundConfig? config;

  const TimerScreen({super.key, this.config});

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {
  @override
  void initState() {
    super.initState();
    // Enable wakelock to keep screen on during workout
    WakelockPlus.enable();

    // Initialize timer with provided config
    if (widget.config != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(timerControllerProvider.notifier).initialize(widget.config!);
      });
    }
  }

  @override
  void dispose() {
    // Disable wakelock when leaving screen
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timerControllerProvider);
    final timerController = ref.read(timerControllerProvider.notifier);

    // Show completion dialog when workout is complete
    if (timerState.isCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showCompletionDialog(context, timerState);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _handleBack(context, timerState),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Round display
              RoundDisplay(
                currentRound: timerState.currentRound,
                totalRounds: timerState.config.numberOfRounds,
                isResting: timerState.isResting,
              ),

              // Countdown circle
              CountdownCircle(
                progress: timerState.progress,
                timeText: timerState.formattedTimeRemaining,
                isWarning: timerState.isWarningZone,
                isResting: timerState.isResting,
              ),

              // Total elapsed time
              Column(
                children: [
                  Text(
                    'Total Time',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                  ),
                  Text(
                    timerState.formattedTotalTime,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),

              // Control buttons
              TimerControls(
                isPaused: timerState.isPaused,
                isResting: timerState.isResting,
                isCompleted: timerState.isCompleted,
                onPlayPause: () {
                  if (timerState.isPaused) {
                    timerController.start();
                  } else {
                    timerController.pause();
                  }
                },
                onSkipRest: () {
                  timerController.skipRest();
                },
                onReset: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Stop Workout'),
                      content: const Text(
                        'Are you sure you want to stop this workout? Progress will not be saved.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Stop'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    timerController.stop();
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                },
              ),

              // Completion message
              if (timerState.isCompleted)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.success.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppTheme.success,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Workout Complete!',
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: AppTheme.success,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBack(BuildContext context, TimerState state) {
    if (!state.isPaused && !state.isCompleted) {
      // Timer is running, confirm exit
      showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit Workout'),
          content: const Text(
            'Your workout is still in progress. Are you sure you want to exit?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                context.pop();
              },
              child: const Text('Exit'),
            ),
          ],
        ),
      );
    } else {
      context.pop();
    }
  }

  void _showCompletionDialog(BuildContext context, TimerState state) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _WorkoutCompletionDialog(
        timerState: state,
        onSave: (difficulty, notes) async {
          // Save workout to database
          final workout = Workout(
            id: const Uuid().v4(),
            completedAt: DateTime.now(),
            roundsCompleted: state.currentRound,
            totalDurationSeconds: state.totalSecondsElapsed,
            difficulty: difficulty,
            notes: notes.isNotEmpty ? notes : null,
            trainingPlanId: null,
            roundConfig: RoundConfigSnapshot(
              numberOfRounds: state.config.numberOfRounds,
              roundDurationSeconds: state.config.roundDurationSeconds,
              restDurationSeconds: state.config.restDurationSeconds,
              configName: state.config.name,
            ),
          );

          await ref.read(workoutActionsProvider.notifier).saveWorkout(workout);

          if (context.mounted) {
            Navigator.pop(context); // Close dialog
            context.pop(); // Return to previous screen
          }
        },
      ),
    );
  }
}

/// Dialog shown when workout is completed
class _WorkoutCompletionDialog extends StatefulWidget {
  final TimerState timerState;
  final Function(int difficulty, String notes) onSave;

  const _WorkoutCompletionDialog({
    required this.timerState,
    required this.onSave,
  });

  @override
  State<_WorkoutCompletionDialog> createState() =>
      _WorkoutCompletionDialogState();
}

class _WorkoutCompletionDialogState extends State<_WorkoutCompletionDialog> {
  int _difficulty = 5;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.celebration, color: AppTheme.success),
          SizedBox(width: 12),
          Text('Workout Complete!'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Summary
            Text(
              'You completed ${widget.timerState.currentRound} rounds in ${widget.timerState.formattedTotalTime}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // Difficulty slider
            Text(
              'How difficult was it?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Easy'),
                Expanded(
                  child: Slider(
                    value: _difficulty.toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: _difficulty.toString(),
                    onChanged: (value) {
                      setState(() {
                        _difficulty = value.toInt();
                      });
                    },
                  ),
                ),
                const Text('Hard'),
              ],
            ),
            Center(
              child: Text(
                _difficulty.toString(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),

            // Notes
            Text(
              'Notes (optional)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                hintText: 'How did it feel? Any observations?',
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close dialog
            context.pop(); // Return to previous screen without saving
          },
          child: const Text('Discard'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(_difficulty, _notesController.text);
          },
          child: const Text('Save Workout'),
        ),
      ],
    );
  }
}
