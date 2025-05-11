import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_home/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame with a value for 'isLoggedIn'.
    await tester.pumpWidget(
      MyApp(isLoggedIn: false),
    ); // Pass the isLoggedIn value

    // Verify that our initial state is correct (isLoggedIn false, so LoginPage is shown).
    expect(
      find.text('Login'),
      findsOneWidget,
    ); // Make sure the login page is showing

    // If you have other tests to do, you can proceed to simulate interactions
    // and assert expectations here, for example:
    // Tap login button and verify redirection to home page (if that's part of your test scenario).
  });
}
