# Password Validation Demo

A Flutter application demonstrating password validation with unit tests.

## Features

- Password validation with the following rules:
  - Password cannot be empty
  - Password must be at least 8 characters long
  - Password and confirm password must match
- Real-time error message clearing when user types
- Success message shown for valid password submission
- Comprehensive widget tests covering all validation scenarios

## Widget Tests

The application includes the following widget tests:

1. Empty password validation
2. Minimum length (8 characters) validation
3. Password matching validation
4. Success case validation
5. Error message clearing behavior

## Getting Started

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter test` to execute the widget tests
4. Run `flutter run` to launch the application

## Project Structure

- `lib/main.dart` - Main application code with password validation logic
- `test/widget_test.dart` - Widget tests covering validation scenarios

## Dependencies

- Flutter SDK
- flutter_test package for widget testing
