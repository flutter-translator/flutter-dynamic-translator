import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';
import 'dart:convert';

void main() {
  TestWidgetsFlutterBinding
      .ensureInitialized(); // Ensure that the binding is initialized

  const MethodChannel channel = MethodChannel('flutter_dynamic_translator');

  setUp(() {
    // This is where you can prepare any necessary setup before each test runs
  });

  test('T.load() and T.get() basic functionality test', () async {
    // Define the test locale and some fake translation data
    const String testLocale = 'en';
    const Map<String, String> fakeTranslations = {
      "hello": "Hello",
      "bye": "Goodbye",
    };

    // Mock the asset loading to simulate reading from 'assets/lang/en.arb'
    ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
      (message) async {
        final String key = const StringCodec().decodeMessage(message)!;
        if (key == 'assets/lang/en.arb') {
          return const StringCodec()
              .encodeMessage(jsonEncode(fakeTranslations));
        }
        return null;
      },
    );

    // Load the mocked locale
    await T.load(testLocale);

    // Assertions to verify that translations work as expected
    expect(T.get('hello'), 'Hello');
    expect(T.get('bye'), 'Goodbye');
    expect(T.get('unknown'), 'unknown'); // Should return the key if not found
  });
}
