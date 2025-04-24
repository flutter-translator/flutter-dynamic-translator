# flutter-dynamic-translator

A Flutter plugin for dynamic translation based on locale files. This plugin allows you to load translation files (e.g., `.arb` files) dynamically based on the current locale and display the translated text throughout your Flutter application.

## Features

- Load and manage translations dynamically at runtime.
- Supports multiple languages by loading locale-specific files.
- Easy integration into Flutter applications with minimal setup.

## Installation

To install `flutter-dynamic-translator`, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_dynamic_translator:
    git:
      url: https://github.com/flutter-translator/flutter-dynamic-translator.git
```

After adding it to your `pubspec.yaml`, run the following command to install the package:

```bash
flutter pub get
```

## Usage

### Import the package

First, import the package in your Dart file where you need to use the translations:

```dart
import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';
```

### Loading Translations

To load a translation for a specific language, use the `T.load()` method:

```dart
await T.load('en');  // Load English translations
await T.load('ko');  // Load Korean translations
await T.load('mn');  // Load Mongolian translations
```

### Retrieving Translated Text

To retrieve a translation for a specific key, use the `T.get()` method:

```dart
String translatedText = T.get('hello_world');
print(translatedText);  // Prints the translated "Hello, World!" based on the loaded language
```

### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await T.load('en');  // Load the default language (English)
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(title: Text('Dynamic Translator')),
                body: Center(
                    child: Text(T.get('hello_world')),
                ),
            ),
        );
    }
}
```

## Supported Languages

- English (`en`)
- Korean (`ko`)
- Mongolian (`mn`)

You can add more languages by creating corresponding `.arb` translation files and adding them to the `assets/lang/` directory.

## Adding New Languages

To add a new language:

1. Create a new `.arb` translation file (e.g., `es.arb` for Spanish).
2. Add the file to the `assets/lang/` directory in your project.
3. Make sure the translation file follows the correct JSON format for translations.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to fork this repository, open issues, or submit pull requests. Contributions are welcome!

## Links

- [GitHub Repository](https://github.com/flutter-translator/flutter-dynamic-translator)
- [License](LICENSE)
