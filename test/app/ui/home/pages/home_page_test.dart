import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:app_random_numbers/app/ui/home/pages/home_page.dart';
import 'package:app_random_numbers/app/ui/home/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:lottie/lottie.dart';

void main() {
  late HomeStore homeStore = HomeStore();

  setUp(() {
    final homeController =
        HomeController(homeStore: homeStore, examApiRepository: null);

    GetIt.I.registerSingleton<HomeController>(homeController);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  testWidgets('Should display list when storeListRandomNumbers is not empty',
      (WidgetTester tester) async {
    homeStore.storeListRandomNumbers.value = [1, 2, 3, 4, 5];

    await tester.pumpWidget(
      const ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: Material(
              child: HomePage(),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    //Verificar se os itens da lista estão sendo exibidos
    expect(find.byType(ReorderableListView), findsOneWidget);
  });

  testWidgets('Should display list when storeListRandomNumbers is empty',
      (WidgetTester tester) async {
    homeStore.storeListRandomNumbers.value = [];

    await tester.pumpWidget(
      const ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: Material(
              child: HomePage(),
            ),
          ),
        ),
      ),
    );

    //Verificar se a lista estiver vazia, se sim, exibir tela com animação com texto
    expect(find.byType(Lottie), findsOneWidget);
    expect(find.textContaining('Lista está vazia'), findsOneWidget);
  });
  testWidgets('Should display loading indicator when storeState is loading',
      (WidgetTester tester) async {
    homeStore.storeState.value = AppStateUtil.loading();

    await tester.pumpWidget(
      const ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: Material(
              child: HomePage(),
            ),
          ),
        ),
      ),
    );

    //Verificar se a page entra em loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
