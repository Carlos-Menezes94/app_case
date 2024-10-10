import 'package:app_random_numbers/app/core/app_state_widget/app_state_widget.dart';
import 'package:app_random_numbers/app/ui/app_initial/controllers/app_initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppInitialPage extends StatefulWidget {
  const AppInitialPage({super.key});

  @override
  State<AppInitialPage> createState() => _AppInitialPageState();
}

class _AppInitialPageState extends State<AppInitialPage> {
  @override
  void initState() {
    _controller.initialNavigation();
    super.initState();
  }

  final _controller = GetIt.I.get<AppInitialController>();

  @override
  Widget build(BuildContext context) {
    _controller.store.storeContextAppInitial.value = context;
    return Scaffold(
      body: AppStateWidget(
        appState: _controller.store.storeStatePage,
        hasGradient: true,
        child: Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.yellow.shade700,
              Colors.orangeAccent,
              Colors.yellow.shade300,
            ],
          ),
        )),
      ),
    );
  }
}
