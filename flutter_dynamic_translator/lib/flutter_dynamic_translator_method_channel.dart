import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_dynamic_translator_platform_interface.dart';

/// An implementation of [FlutterDynamicTranslatorPlatform] that uses method channels.
class MethodChannelFlutterDynamicTranslator extends FlutterDynamicTranslatorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_dynamic_translator');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
