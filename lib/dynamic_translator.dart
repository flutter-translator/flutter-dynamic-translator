import 'dart:convert';
import 'package:flutter/services.dart';

// Translation class to handle the loading and fetching of translations.
class T {
  static Map<String, String> _t = {};

  // Load the translation file based on the locale (language).
  static Future<void> load(String locale) async {
    print('Loading translation for locale: $locale');
    final data = await rootBundle.loadString('assets/lang/$locale.arb');
    final map = json.decode(data) as Map<String, dynamic>;
    _t = {
      for (var key in map.keys)
        if (!key.startsWith('@')) key: map[key].toString(),
    };
  }

  // Fetch the translation for a specific key, if not found return the key itself.
  static String get(String key) => _t[key] ?? key;
}
