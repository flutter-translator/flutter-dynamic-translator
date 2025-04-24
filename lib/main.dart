import 'package:flutter/material.dart';
import 'dynamic_translator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await T.load('ko');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentLocale = 'ko';

  void changeLocale(String newLocale) async {
    await T.load(newLocale);
    setState(() {
      currentLocale = newLocale;
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

class MyHomePage extends StatelessWidget {
  final String currentLocale;
  final Function(String) onLocaleChanged;

  const MyHomePage({
    Key? key,
    required this.currentLocale,
    required this.onLocaleChanged,
  }) : super(key: key);

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
            Text(
              T.get('hello_world'),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: currentLocale,
              items: [
                DropdownMenuItem(value: 'ko', child: Text('Korean')),
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'mn', child: Text('Mongolian')),
              ],
              onChanged: (newValue) {
                if (newValue != null) {
                  onLocaleChanged(newValue);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
