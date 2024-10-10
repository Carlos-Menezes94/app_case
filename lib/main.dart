import 'package:app_random_numbers/app/core/dependency_injector/dependency_injector.dart';
import 'package:app_random_numbers/app/core/themes/theme_config.dart';
import 'package:app_random_numbers/app/ui/app_initial/pages/app_initial_page.dart';
import 'package:app_random_numbers/app/ui/home/pages/home_page.dart';
import 'package:app_random_numbers/app/ui/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  DependencyInjector.start();
  runApp(const AppMain());
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 812),
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const AppInitialPage(),
          '/login_page': (context) => const LoginPage(),
          '/home_page': (context) => const HomePage(),
        },
      ),
    );
  }
}
