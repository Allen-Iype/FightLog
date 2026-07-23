# FightLog

Boxing training tracker for Android/iOS: a configurable round timer, workout logging with difficulty ratings and notes, training-plan management, and weekly/monthly progress charts. Offline-first — everything is stored locally in SQLite.

Flutter + Riverpod + Drift, with clean-architecture layering (presentation / domain / data).

## Features

- **Round timer** — configurable rounds, round duration, and rest periods; visual countdown; play/pause/skip-rest; screen stays awake during workouts.
- **Workout logging** — completed rounds, total time, difficulty (1–10), free-form notes.
- **Progress stats** — weekly and monthly totals, rounds-per-day bar charts (fl_chart), streak tracking.
- **Training plans** — multi-day schedules with a template system, plus a quick-start default (3×3min).
- **Offline-first** — all data in local SQLite via Drift; no network required.

## Architecture

Clean Architecture with MVVM and the repository pattern:

```
Presentation (screens, widgets, Riverpod providers)
        ↓
Domain (entities, repository interfaces — pure Dart)
        ↓
Data (Drift database, DAOs, repository implementations)
```

The domain layer has no Flutter or database dependencies, so business logic is unit-testable in isolation, and the data layer could be swapped (e.g. for a synced backend) without touching the UI.

## Tech stack

- **Flutter 3.11+ / Dart 3.11+**
- **Riverpod** (with codegen) — state management and DI
- **Drift** — type-safe SQLite with reactive queries
- **go_router** — declarative navigation
- **fl_chart** — statistics charts
- **audioplayers / vibration / wakelock_plus** — timer feedback

## Project structure

```
lib/
├── main.dart
├── app/            # Router, theme
├── core/           # Constants, utils, extensions
├── domain/         # Entities, repository interfaces
├── data/           # Drift database, tables, DAOs, repository impls
└── presentation/   # Providers, screens (home/timer/history/plans/stats), widgets
```

## Getting started

Prerequisites: Flutter SDK 3.11+.

```bash
git clone https://github.com/Allen-Iype/FightLog.git
cd FightLog
flutter pub get

# Generate Drift database + Riverpod provider code
dart run build_runner build --delete-conflicting-outputs

flutter run
```

Supported: Android (API 21+) and iOS 13+. Web/desktop are untested.

## Database schema

Three tables: `workouts` (completed sessions with their round configuration snapshot), `training_plans`, and `training_days` (per-day round configs, FK to plans). Definitions live in `lib/data/database/tables/`.

## Testing

```bash
flutter test              # unit + widget tests
flutter test --coverage
flutter analyze
```

## Known issues

- 4 type-annotation warnings from the Drift-generated `Workout` class colliding with the domain `Workout` name (`lib/data/database/app_database.dart`). Compile-time warnings only; a rename refactor is planned.

## Roadmap

Next: audio bell sounds and vibration patterns for the timer, a training-plan builder UI, and data export (CSV/JSON). Later, possibly cloud sync and multi-device support — the repository layer was designed with that seam in mind.

## How this was built

Built by directing AI coding agents (Claude Code) through a phased implementation plan; the architecture, feature scope, and review are mine.

## License

MIT — see [LICENSE](LICENSE).
