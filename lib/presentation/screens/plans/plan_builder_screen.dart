import 'package:fight_log/domain/entities/training_plan.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Plan Builder Screen (Simplified placeholder)
class PlanBuilderScreen extends StatelessWidget {
  final TrainingPlan? existingPlan;

  const PlanBuilderScreen({super.key, this.existingPlan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(existingPlan == null ? 'Create Plan' : 'Edit Plan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.construction,
                size: 80,
                color: Colors.orange,
              ),
              const SizedBox(height: 16),
              Text(
                'Plan Builder',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'This feature is coming soon!\nYou can use Quick Start for now.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
