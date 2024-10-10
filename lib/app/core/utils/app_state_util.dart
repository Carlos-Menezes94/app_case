class AppStateUtil {
  late final AppStateEnum _state;

  AppStateUtil() : _state = AppStateEnum.initial;

  AppStateUtil.initial() : _state = AppStateEnum.initial;
  AppStateUtil.loading() : _state = AppStateEnum.loading;
  AppStateUtil.error() : _state = AppStateEnum.error;
  AppStateUtil.success() : _state = AppStateEnum.success;

  bool isInitial() => _state == AppStateEnum.initial;
  bool isLoading() => _state == AppStateEnum.loading;
  bool hasError() => _state == AppStateEnum.error;
  bool hasSuccess() => _state == AppStateEnum.success;
}

enum AppStateEnum { initial, loading, error, success }
