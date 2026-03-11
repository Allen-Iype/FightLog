// FightLog widget tests
//
// To run tests: flutter test

import 'package:flutter_test/flutter_test.dart';
import 'package:fight_log/main.dart';

void main() {
  testWidgets('App smoke test - launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FightLogApp());

    // Verify that the app launches
    // (More specific tests can be added later)
    expect(find.byType(FightLogApp), findsOneWidget);
  });
}
