// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_testing/main.dart';

void main() {
  testWidgets(
      'Should display error message "Please enter password." when user clicks submit button with empty password',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: PasswordValidationPage()));

    // Act
    final passwordField = find.byType(TextField).first;
    final submitButton = find.text('Submit');
    await tester.enterText(passwordField, '');
    await tester.tap(submitButton);
    await tester.pump();

    // Assert
    expect(find.text('Please enter password.'), findsOneWidget);
  });
}
