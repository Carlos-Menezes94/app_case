class AppStateUtil {
  late final AppStateEnum _state;

  AppStateUtil() : _state = AppStateEnum.idle;

  AppStateUtil.idle() : _state = AppStateEnum.idle;
  AppStateUtil.loading() : _state = AppStateEnum.loading;
  AppStateUtil.error() : _state = AppStateEnum.error;
  AppStateUtil.success() : _state = AppStateEnum.success;

  bool isIdle() => _state == AppStateEnum.idle;
  bool isLoading() => _state == AppStateEnum.loading;
  bool hasError() => _state == AppStateEnum.error;
  bool hasSuccess() => _state == AppStateEnum.success;
}

enum AppStateEnum { idle, loading, error, success }
