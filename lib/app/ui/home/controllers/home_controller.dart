import 'package:app_random_numbers/app/core/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:app_random_numbers/app/core/widgets/app_message_custom_widget.dart';
import 'package:app_random_numbers/app/ui/home/stores/home_store.dart';
import 'package:app_random_numbers/app/ui/login/pages/login_page.dart';

class HomeController extends Controller {
  final HomeStore homeStore;
  final SecureStorage secureStorage;

  HomeController({
    required this.homeStore,
    required this.secureStorage,
  });

  void logout() async {
    try {
      await secureStorage.deleteEncryptedData('boxToken');

      Navigator.of(homeStore.storeContextHome.value!).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } catch (e) {
      AppMessageCustomWidget().error(
        homeStore.storeContextHome.value!,
        'Falha ao tentar fazer o logout de sua conta',
      );
    }
  }

  isDebugTest() {
    final response = WidgetsBinding.instance is TestWidgetsFlutterBinding;
    return response;
  }
}
