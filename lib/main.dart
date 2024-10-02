import 'package:app_random_numbers/app/core/dependency_injector/dependecy_injector.dart';
import 'package:app_random_numbers/app/core/themes/theme_config.dart';
import 'package:app_random_numbers/app/ui/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  DependecyInjector.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 812),
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
