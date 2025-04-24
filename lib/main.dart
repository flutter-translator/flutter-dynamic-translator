import 'package:flutter/material.dart';
import 'dynamic_translator.dart'; // Import the dynamic translation logic

void main() async {
  // Set the initial locale (in this case 'ko' for Korean)
  String locale = 'ko'; // The locale can be dynamically set based on user preferences
  await T.load(locale); // Load the translation file for the selected locale

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
            // Display the translated text based on the selected locale
            Text(
              T.get('hello_world'), // Fetch the translation for the key 'hello_world'
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            LanguageSelector(), // Language selector widget to change the locale
          ],
        ),
      ),
    );
  }
}

// A widget to allow the user to select a language
class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: 'ko', // Currently selected language
      items: [
        DropdownMenuItem(value: 'ko', child: Text('Korean')),
        DropdownMenuItem(value: 'en', child: Text('English')),
        DropdownMenuItem(value: 'mn', child: Text('Mongolian')),
      ],
      onChanged: (newValue) async {
        await T.load(newValue!); // Load the selected language's translation file
        (context as Element).reassemble(); // Rebuild the widget to reflect the new translations
      },
    );
  }
}
