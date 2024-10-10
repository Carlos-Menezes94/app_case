import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_random_numbers/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('AppInitial navigation E2E Tests  ---  ', () {
    late SecureStorage secureStorage;

    setUp(() async {
      secureStorage = SecureStorage();
    });
    tearDown(() async {
      GetIt.I.reset();
      await secureStorage.deleteEncryptedData('boxToken');
    });

    testWidgets('Should load the HomePage if you have a token locally',
        (WidgetTester tester) async {
      final mockMapToken = {'token': 'X123dadsSd24ds5'};
      await secureStorage.saveEncryptedData(
          'boxToken', mockMapToken.toString());

      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('Should load the Login if you have a token locally',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Seja bem vindo(a)'), findsOneWidget);
      expect(find.text('Entrar'), findsOneWidget);
    });
  });
}
