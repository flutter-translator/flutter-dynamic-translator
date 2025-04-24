import 'package:flutter/material.dart';
import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await T.load('ko'); // Load Korean language initially
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentLocale = 'ko'; // Default language is Korean

  // Function to change the language
  void changeLocale(String newLocale) async {
    await T.load(newLocale); // Load the translation for the new language
    setState(() {
      currentLocale = newLocale; // Update the language for the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Translator',
      home: MyHomePage(
        currentLocale: currentLocale, // Pass current language
        onLocaleChanged: changeLocale, // Function to change language
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Changed to StatelessWidget
  final String currentLocale; // Holds the current language
  final Function(String) onLocaleChanged; // Function to change the language

  const MyHomePage({
    Key? key,
    required this.currentLocale,
    required this.onLocaleChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Translation Example'), // App bar title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the translation for "hello_world" key
            Text(
              T.get('hello_world'), // Get the translation for "hello_world"
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Dropdown to select the language
            DropdownButton<String>(
              value: currentLocale, // Currently selected language
              items: [
                DropdownMenuItem(value: 'ko', child: Text('Korean')),
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'mn', child: Text('Mongolian')),
              ],
              onChanged: (newValue) {
                if (newValue != null) {
                  onLocaleChanged(
                      newValue); // Change the language when selected
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
