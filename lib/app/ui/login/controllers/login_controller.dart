import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:app_random_numbers/app/data/models/login_model.dart';
import 'package:app_random_numbers/app/domain/repositories/login/login_repository_abstract.dart';
import 'package:app_random_numbers/app/ui/home/pages/home_page.dart';
import 'package:app_random_numbers/app/core/widgets/app_message_custom_widget.dart';
import 'package:app_random_numbers/app/ui/login/stores/login_store.dart';
import 'package:flutter/material.dart';

class LoginController {
  final LoginRepositoryAbstract loginRepository;
  final LoginStore store;
  LoginController({required this.loginRepository, required this.store});

  Future<void> loginWithEmailPassword() async {
    store.storePageLoading.value = AppStateUtil.loading();
    final response = await loginRepository.loginWithEmailPassword(
        loginEntity: LoginModel(
      email: store.storeControllerEmail.value.text,
      password: store.storeControllerPassword.value.text,
    ));

    response.fold(
      (failure) {
        AppMessageCustomWidget().error(
          store.storeContextLogin.value!,
          messagingException(failure.message),
        );
        store.storePageLoading.value = AppStateUtil.error();
      },
      (success) {
        Navigator.of(store.storeContextLogin.value!).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        store.storePageLoading.value = AppStateUtil.success();
      },
    );
  }

  String messagingException(String message) {
    switch (message) {
      case 'user not found':
        return 'E-mail do usuário não localizado, verifique se esta digitado corretamente.';
      case 'Missing email or username':
        return 'E-mail ou senha está incorreta/ausente.';

      default:
        return 'Aconteceu um problema ao tentar fazer login, tente novamente.';
    }
  }
}
