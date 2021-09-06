// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final firstCounter = '0';
    final secondCounter = '1';
    final firstlistCounterTextFinder = find.byValueKey(firstCounter);
    final secondlistCounterTextFinder = find.byValueKey(secondCounter);
    final counterTextFinder = find.byValueKey('counter');

    final addCounterButtonFinder = find.byValueKey('add_counter_btn');
    final buttonFinder = find.byValueKey('increment');

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(firstlistCounterTextFinder), "0");
    });

    test('goes to the counter\'s page', () async {
      // First, tap the button to go to incrementing page.
      await driver.tap(firstlistCounterTextFinder);

      // Then, verify the counter text is 0.
      expect(await driver.getText(counterTextFinder), "0");
    });
    test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");

      await driver.tap(find.pageBack());
    });

    test('goes to the counter\'s page', () async {
      // whtether counter changes shown here.
      expect(await driver.getText(counterTextFinder), "1");

      //Adding new counter
      await driver.tap(addCounterButtonFinder);

      // Then, verify the counter text is 0.
      expect(await driver.getText(secondlistCounterTextFinder), "0");
    });
  });
}
