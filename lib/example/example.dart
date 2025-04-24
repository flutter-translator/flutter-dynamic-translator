import 'package:flutter/material.dart';
import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await T.load('ko'); // Эхэндээ Korean хэл ачаалж байна
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentLocale = 'ko'; // Эхний хэл Korean байна

  // Хэл солих функц
  void changeLocale(String newLocale) async {
    await T.load(newLocale); // Шинэ хэлд тохирох орчуулга татаж авах
    setState(() {
      currentLocale = newLocale; // Шинэ хэлтэй тохирох текстийг харуулах
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Translator',
      home: MyHomePage(
        currentLocale: currentLocale,
        onLocaleChanged: changeLocale,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String currentLocale;
  final Function(String) onLocaleChanged;

  const MyHomePage({
    Key? key,
    required this.currentLocale,
    required this.onLocaleChanged,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Translation Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Орчуулга гаргах хэсэг
            Text(
              T.get('hello_world'), // "hello_world" түлхүүрийн орчуулгыг авах
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Хэл сонгох Dropdown
            DropdownButton<String>(
              value: widget.currentLocale, // Одоогийн хэл
              items: [
                DropdownMenuItem(value: 'ko', child: Text('Korean')),
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'mn', child: Text('Mongolian')),
              ],
              onChanged: (newValue) {
                if (newValue != null) {
                  widget.onLocaleChanged(newValue); // Хэл солих функц
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
