package com.example.flutter_dynamic_translator

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin

class FlutterDynamicTranslatorPlugin : FlutterPlugin {
    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        // Dart-only plugin, no native Android code needed
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        // Dart-only plugin, no cleanup needed
    }
}
