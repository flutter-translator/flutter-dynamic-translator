import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _translatedText = 'Loading translation...';

  @override
  void initState() {
    super.initState();
    _loadTranslations();
  }

  // Function to load translations
  Future<void> _loadTranslations() async {
    String translation;
    try {
      await T.load('en'); // Load the English translations
      translation = T.get('hello_world'); // Get a translated string
    } catch (e) {
      translation = 'Failed to load translation.';
    }

    if (!mounted) return;

    setState(() {
      _translatedText = translation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Dynamic Translator Example'),
        ),
        body: Center(
          child: Text('Translated Text: $_translatedText\n'),
        ),
      ),
    );
  }
}
