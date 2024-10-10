import 'package:app_random_numbers/app/core/controller/controller.dart';
import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:app_random_numbers/app/ui/app_initial/stores/app_initial_store.dart';
import 'package:app_random_numbers/app/ui/home/pages/home_page.dart';
import 'package:app_random_numbers/app/ui/login/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppInitialController extends Controller {
  final AppInitialStore store;
  final SecureStorage secureStorage;

  AppInitialController({required this.store, required this.secureStorage});
  //Metodo que realiza a navegação inicial
  Future<void> initialNavigation() async {
    store.storeStatePage.value = AppStateUtil.loading();

    final response = await secureStorage.getEncryptedData('boxToken');
    //Verifica se existe token, se sim o usuário está logado e será levado para HomePage
    await Future.delayed(const Duration(seconds: 4));
    if (response != null) {
      Navigator.of(store.storeContextAppInitial.value!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      //Navega para LoginPage caso não esteja logado
      Navigator.of(store.storeContextAppInitial.value!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
    store.storeStatePage.value = AppStateUtil.success();
  }
}
