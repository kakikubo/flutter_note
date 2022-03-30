// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_note/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('保存'), findsOneWidget);
    expect(find.text('テストです'), findsNothing);
    final elevatedButtonDisabled =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(elevatedButtonDisabled.onPressed, isNull);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('保存'));
    await tester.enterText(find.byType(TextField), 'テストです');
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('テストです'), findsOneWidget);
    final elevatedButtonEnabled =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(elevatedButtonEnabled.onPressed, isNotNull);
  });
}
