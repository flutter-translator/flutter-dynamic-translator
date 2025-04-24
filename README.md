# 🌐 Flutter Dynamic Translator

A lightweight and simple dynamic translation loader for Flutter apps using `.arb` files.

> No need for `flutter_localizations` or `intl` – just pure Dart!

---

## 🚀 Features

- ✅ Easy to use translation service
- 🗂 Dynamic `.arb` file loader
- 🔁 Runtime locale switching
- ❌ No `intl` or `flutter_localizations` dependency required
- 📁 Minimal folder structure

```

## 📂 Project Structure

flutter-dynamic-translator/
├── lib/
│ └── dynamic_translator.dart # Translation logic
├── assets/
│ └── lang/
│ ├── en.arb
│ ├── mn.arb
│ └── ko.arb
├── pubspec.yaml
└── README.md

```

## 📦 Getting Started

### 1. Add your translations

Create `.arb` files under `assets/lang/`:

```json
// en.arb
{
  "hello_world": "Hello, World!",
  "welcome": "Welcome!"
}
```

### 2. Register the assets

In pubspec.yaml:

```
flutter:
  assets:
    - assets/lang/

```

### 3. Use in your app

Import and load translations:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await T.load('mn'); // Load Mongolian translations
  runApp(MyApp());
}

```

Access translations:

```dart
Text(T.get('hello_world'))

```

Switch locale at runtime:

```dart
await T.load('en');
(context as Element).reassemble();

```

🧠 Tip

- Translation keys fallback to the key itself if not found.

- You can dynamically load locales based on user settings or device locale.
