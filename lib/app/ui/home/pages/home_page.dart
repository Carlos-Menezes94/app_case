import 'package:app_random_numbers/app/core/mixins/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:app_random_numbers/app/ui/login/pages/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenUtilityMixin {
  final HomeController _controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.homeStore.storeContextHome.value = context;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              key: const Key('button_appbar_logout'),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                AppMessageCustom()
                    .confirmation(context, 'Você deseja sair mesmo?', () {
                  _controller.logout();
                });
              },
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: _controller.homeStore.storeState,
          builder: (BuildContext context, state, Widget? child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(16)),
              child: Column(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                            'lib/app/core/assets/ghost_list_empty_lottie.json',
                            fit: BoxFit.contain,
                            repeat: !_controller.isDebugTest()),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
