import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_dynamic_translator/flutter_dynamic_translator.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Translation test', (WidgetTester tester) async {
    await T.load('en');
    final hello = T.get('hello');

    expect(hello, isNotEmpty); // тухайн орчуулгын утга байгаа эсэхийг шалгана
  });
}
