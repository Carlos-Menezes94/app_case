import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:flutter/material.dart';

class AppInitialStore {
  ValueNotifier<AppStateUtil> storeStatePage =
      ValueNotifier<AppStateUtil>(AppStateUtil.initial());
  ValueNotifier<BuildContext?> storeContextAppInitial = ValueNotifier(null);
}
