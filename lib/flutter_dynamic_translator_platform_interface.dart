import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_dynamic_translator_method_channel.dart';

abstract class FlutterDynamicTranslatorPlatform extends PlatformInterface {
  /// Constructs a FlutterDynamicTranslatorPlatform.
  FlutterDynamicTranslatorPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDynamicTranslatorPlatform _instance =
      MethodChannelFlutterDynamicTranslator();

  /// The default instance of [FlutterDynamicTranslatorPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDynamicTranslator].
  static FlutterDynamicTranslatorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDynamicTranslatorPlatform] when
  /// they register themselves.
  static set instance(FlutterDynamicTranslatorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
