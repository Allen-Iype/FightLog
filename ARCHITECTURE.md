# FightLog - Architecture Documentation

## Overview
FightLog follows **Clean Architecture** principles combined with **MVVM** pattern and **Repository** pattern for a maintainable, testable, and scalable codebase.

## Folder Structure

```
lib/
├── main.dart                      # App entry point with Riverpod setup
├── app/
│   ├── router.dart               # Go Router configuration with typed routes
│   └── theme.dart                # App-wide theme (dark mode with sporty accents)
├── core/
│   ├── constants/
│   │   ├── app_constants.dart   # App-wide constants
│   │   └── asset_paths.dart     # Asset path constants
│   ├── utils/
│   │   ├── date_formatter.dart  # Date/time formatting utilities
│   │   └── duration_formatter.dart
│   └── extensions/
│       └── datetime_extensions.dart
├── data/
│   ├── database/
│   │   ├── app_database.dart    # Drift database setup
│   │   ├── daos/                # Data Access Objects
│   │   │   ├── workout_dao.dart
│   │   │   └── training_plan_dao.dart
│   │   └── tables/              # Drift table definitions
│   │       ├── workout_table.dart
│   │       ├── training_plan_table.dart
│   │       └── round_config_table.dart
│   ├── models/                   # Data models (from database)
│   └── repositories/             # Repository implementations
│       ├── workout_repository_impl.dart
│       └── training_plan_repository_impl.dart
├── domain/
│   ├── entities/                 # Business entities (pure Dart)
│   │   ├── workout.dart
│   │   ├── training_plan.dart
│   │   └── round_config.dart
│   └── repositories/             # Repository interfaces
│       ├── workout_repository.dart
│       └── training_plan_repository.dart
└── presentation/
    ├── providers/                # Riverpod providers
    │   ├── database_provider.dart
    │   ├── workout_provider.dart
    │   ├── training_plan_provider.dart
    │   └── timer_provider.dart
    ├── screens/
    │   ├── home/
    │   │   ├── home_screen.dart
    │   │   └── widgets/
    │   │       ├── stats_card.dart
    │   │       └── quick_start_button.dart
    │   ├── timer/
    │   │   ├── timer_screen.dart
    │   │   └── widgets/
    │   │       ├── round_display.dart
    │   │       ├── countdown_circle.dart
    │   │       └── timer_controls.dart
    │   ├── history/
    │   │   ├── history_screen.dart
    │   │   ├── workout_detail_screen.dart
    │   │   └── widgets/
    │   │       └── workout_card.dart
    │   ├── plans/
    │   │   ├── plans_screen.dart
    │   │   ├── plan_builder_screen.dart
    │   │   └── widgets/
    │   │       └── plan_card.dart
    │   └── stats/
    │       ├── stats_screen.dart
    │       └── widgets/
    │           ├── weekly_chart.dart
    │           └── monthly_chart.dart
    └── widgets/
        ├── common/
        │   ├── app_button.dart
        │   └── app_card.dart
        └── dialogs/
            └── difficulty_dialog.dart

test/
├── unit/
│   ├── repositories/
│   └── providers/
└── widget/
```

## Architecture Layers

### 1. Domain Layer (Business Logic)
- **Entities**: Pure Dart classes representing business models
- **Repositories**: Abstract interfaces defining data operations
- No dependencies on Flutter or external packages
- Contains core business rules

### 2. Data Layer (Data Management)
- **Database**: Drift setup and table definitions
- **DAOs**: Data Access Objects for database operations
- **Repository Implementations**: Concrete implementations of domain repositories
- Handles data persistence and retrieval

### 3. Presentation Layer (UI & State)
- **Providers**: Riverpod providers for state management
- **Screens**: Feature-based screen organization
- **Widgets**: Reusable UI components
- Depends on domain layer through repositories

## State Management - Riverpod

We use Riverpod for state management with the following patterns:

- **Provider**: For read-only values and services
- **StateProvider**: For simple state that can change
- **StateNotifierProvider**: For complex state with business logic
- **FutureProvider**: For async operations
- **StreamProvider**: For reactive data streams

## Database - Drift

Drift provides type-safe SQL queries with:
- Compile-time query validation
- Reactive queries (streams)
- Migration support
- Easy testing

## Navigation - Go Router

Benefits:
- Declarative routing
- Type-safe navigation
- Deep linking support
- URL-based routing

## Key Design Decisions

1. **Offline-First**: All data stored locally in Drift database
2. **Sync-Ready**: Repository pattern allows easy cloud sync integration later
3. **Testability**: Clean architecture enables easy unit testing
4. **Scalability**: Feature-based folder structure scales well
5. **Type Safety**: Drift + Go Router provide compile-time safety

## Future Extensions

- Cloud sync hooks in repositories
- Background sync service
- Export/import functionality
- Social features (sharing workouts)
