import 'dart:convert';
import 'package:flutter/services.dart';

class T {
  static Map<String, String> _translations = {};

  static const MethodChannel _channel =
      MethodChannel('flutter_dynamic_translator');

  // Optional function: get platform version (if needed)
  static Future<String?> getPlatformVersion() async {
    try {
      final String? version = await _channel.invokeMethod('getPlatformVersion');
      return version;
    } on PlatformException {
      return null;
    }
  }

  static Future<void> load(String locale) async {
    final jsonString = await rootBundle.loadString('assets/lang/$locale.arb');
    final jsonMap = json.decode(jsonString);
    _translations = Map<String, String>.from(jsonMap);
  }

  static String get(String key) {
    return _translations[key] ?? key;
  }
}
