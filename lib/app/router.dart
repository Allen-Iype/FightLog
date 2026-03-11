import 'package:fight_log/domain/entities/round_config.dart';
import 'package:fight_log/domain/entities/training_plan.dart';
import 'package:fight_log/domain/entities/workout.dart';
import 'package:fight_log/presentation/screens/history/history_screen.dart';
import 'package:fight_log/presentation/screens/history/workout_detail_screen.dart';
import 'package:fight_log/presentation/screens/home/home_screen.dart';
import 'package:fight_log/presentation/screens/plans/plan_builder_screen.dart';
import 'package:fight_log/presentation/screens/plans/plans_screen.dart';
import 'package:fight_log/presentation/screens/stats/stats_screen.dart';
import 'package:fight_log/presentation/screens/timer/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// App router configuration using Go Router
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Shell route for main navigation with bottom nav bar
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        // Home / Dashboard
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),

        // History
        GoRoute(
          path: '/history',
          name: 'history',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HistoryScreen(),
          ),
        ),

        // Training Plans
        GoRoute(
          path: '/plans',
          name: 'plans',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PlansScreen(),
          ),
        ),

        // Stats
        GoRoute(
          path: '/stats',
          name: 'stats',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const StatsScreen(),
          ),
        ),
      ],
    ),

    // Timer screen (full screen, no nav bar)
    GoRoute(
      path: '/timer',
      name: 'timer',
      pageBuilder: (context, state) {
        final config = state.extra as RoundConfig?;
        return MaterialPage(
          key: state.pageKey,
          child: TimerScreen(config: config),
        );
      },
    ),

    // Workout detail
    GoRoute(
      path: '/workout/:id',
      name: 'workout-detail',
      pageBuilder: (context, state) {
        final workout = state.extra as Workout;
        return MaterialPage(
          key: state.pageKey,
          child: WorkoutDetailScreen(workout: workout),
        );
      },
    ),

    // Plan builder
    GoRoute(
      path: '/plan-builder',
      name: 'plan-builder',
      pageBuilder: (context, state) {
        final plan = state.extra as TrainingPlan?;
        return MaterialPage(
          key: state.pageKey,
          child: PlanBuilderScreen(existingPlan: plan),
        );
      },
    ),
  ],
);

/// Main shell with bottom navigation bar
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const MainBottomNav(),
    );
  }
}

/// Bottom navigation bar for main screens
class MainBottomNav extends StatelessWidget {
  const MainBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    int selectedIndex = 0;
    if (location == '/') {
      selectedIndex = 0;
    } else if (location == '/history') {
      selectedIndex = 1;
    } else if (location == '/plans') {
      selectedIndex = 2;
    } else if (location == '/stats') {
      selectedIndex = 3;
    }

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.goNamed('home');
            break;
          case 1:
            context.goNamed('history');
            break;
          case 2:
            context.goNamed('plans');
            break;
          case 3:
            context.goNamed('stats');
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.history_outlined),
          selectedIcon: Icon(Icons.history),
          label: 'History',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_today_outlined),
          selectedIcon: Icon(Icons.calendar_today),
          label: 'Plans',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
      ],
    );
  }
}
