import 'package:app_random_numbers/app/core/utils/app_state_util.dart';
import 'package:flutter/material.dart';

class HomeStore {
  ValueNotifier<List<int>> storeListRandomNumbers = ValueNotifier([]);
  ValueNotifier<String> storeAmountRandomNumbers = ValueNotifier('');
  ValueNotifier<BuildContext?> storeContextHome = ValueNotifier(null);
  ValueNotifier<AppStateUtil> storeState = ValueNotifier(AppStateUtil.idle());
  ValueNotifier<int?> stateDraggedIndex = ValueNotifier(null);
}
