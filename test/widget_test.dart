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

  testWidgets(
      'Should display error message "Password must be at least 8 characters long." when user clicks submit button with password less than 8 characters',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: PasswordValidationPage()));

    // Act
    final passwordField = find.byType(TextField).first;
    final submitButton = find.text('Submit');
    await tester.enterText(passwordField, '1234567');
    await tester.tap(submitButton);
    await tester.pump();

    // Assert
    expect(
        find.text('Password must be at least 8 characters.'), findsOneWidget);
  });

  testWidgets(
      'Should display error message "Invalid Password" when user clicks submit button with password not match',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: PasswordValidationPage()));

    // Act
    final passwordField = find.byType(TextField).first;
    final confirmPasswordField = find.byType(TextField).last;
    final submitButton = find.text('Submit');
    await tester.enterText(passwordField, '12345678');
    await tester.enterText(confirmPasswordField, '12345679');
    await tester.tap(submitButton);
    await tester.pump();

    // Assert
    expect(find.text('Invalid Password'), findsOneWidget);
  });

  testWidgets(
      'Should display success message when user clicks submit button with valid password',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: PasswordValidationPage()));

    // Act
    final passwordField = find.byType(TextField).first;
    final confirmPasswordField = find.byType(TextField).last;
    final submitButton = find.text('Submit');
    await tester.enterText(passwordField, '12345678');
    await tester.enterText(confirmPasswordField, '12345678');
    await tester.tap(submitButton);
    await tester.pump();

    // Assert
    expect(find.text('Successfully'), findsOneWidget);
  });

  testWidgets('Should clear error message when user changes password',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(home: PasswordValidationPage()));

    // Act
    final passwordField = find.byType(TextField).first;
    final submitButton = find.text('Submit');
    await tester.enterText(passwordField, '12345678');
    await tester.tap(submitButton);
    await tester.pump();

    // Assert
    expect(find.text('Invalid Password'), findsOneWidget);

    // Act
    await tester.enterText(passwordField, '');
    await tester.pump();

    // Assert
    expect(find.text('Invalid Password'), findsNothing);
  });
}
