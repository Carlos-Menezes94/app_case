import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_random_numbers/main.dart' as app;
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() {
    GetIt.I.reset();
  });
  group('LoginPage E2E Tests  --->  ', () {
    testWidgets('Should login successfully and navigate to HomePage',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('text_email')), 'eve.holt@reqres.in');
      await tester.enterText(
          find.byKey(const Key('text_password')), '12123ds4332');

      await tester.tap(find.byKey(const Key('button_enter_login')));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('button_appbar_logout')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('button_logout_confirm')));
      await tester.pumpAndSettle();

      expect(find.text('Seja bem-vindo(a)'), findsOneWidget);
    });
    testWidgets(
        'Should display error messages when email and password fields are empty or invalid',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('button_enter_login')));
      await tester.pumpAndSettle();

      expect(find.text('Por favor, digite seu e-mail'), findsOneWidget);
      expect(find.text('Por favor, digite sua senha'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('text_email')), 'teste@@');
      await tester.enterText(find.byKey(const Key('text_password')), '111');
      await tester.tap(find.byKey(const Key('button_enter_login')));

      await tester.pumpAndSettle();

      expect(find.text('Por favor, digite um e-mail válido'), findsOneWidget);
      expect(find.text('A senha contém no mínimo 6 dígitos'), findsOneWidget);
    });
    testWidgets(
        'Should show information in the AppMessageCustomWidget when a login request fails, such as email not found',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('text_email')), 'eve.holt@reqre2222s.in');
      await tester.enterText(
          find.byKey(const Key('text_password')), '12123ds4332');

      await tester.tap(find.byKey(const Key('button_enter_login')));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.byKey(const Key('alert_dialog_info_error')), findsOneWidget);
    });
  });
}
