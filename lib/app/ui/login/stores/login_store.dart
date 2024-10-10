import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:flutter/material.dart';

class LoginStore {
  ValueNotifier<BuildContext?> storeContextLogin = ValueNotifier(null);
  ValueNotifier<TextEditingController> storeControllerEmail =
      ValueNotifier(TextEditingController(text: ''));
  ValueNotifier<TextEditingController> storeControllerPassword =
      ValueNotifier(TextEditingController(text: ''));
  ValueNotifier<GlobalKey<FormState>> storeFormKey =
      ValueNotifier(GlobalKey<FormState>());

  ValueNotifier<AppStateUtil> storePageLoading =
      ValueNotifier<AppStateUtil>(AppStateUtil.initial());

  ValueNotifier<bool> storeShowPassword = ValueNotifier<bool>(false);
}
