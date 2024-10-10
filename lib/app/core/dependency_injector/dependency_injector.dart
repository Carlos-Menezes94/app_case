import 'package:app_random_numbers/app/core/rest_client/rest_client.dart';
import 'package:app_random_numbers/app/data/data_sources/login/login_data_source_abstract.dart';
import 'package:app_random_numbers/app/data/data_sources/login/login_data_source_impl.dart';
import 'package:app_random_numbers/app/data/repositories/login/login_repository_impl.dart';
import 'package:app_random_numbers/app/domain/repositories/login/login_repository_abstract.dart';
import 'package:app_random_numbers/app/ui/app_initial/controllers/app_initial_controller.dart';
import 'package:app_random_numbers/app/ui/app_initial/stores/app_initial_store.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:app_random_numbers/app/ui/home/stores/home_store.dart';
import 'package:app_random_numbers/app/ui/login/controllers/login_controller.dart';
import 'package:app_random_numbers/app/ui/login/stores/login_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../secure/secure_storage.dart';

class DependencyInjector {
  static void start() {
    GetIt getIt = GetIt.instance;
    final dio = Dio();
    getIt.registerSingleton(SecureStorage());

    getIt.registerSingleton(RestClient(dio: dio));

    getIt.registerSingleton(HomeStore());

    getIt.registerFactory(() => HomeController(
        homeStore: GetIt.I.get<HomeStore>(),
        secureStorage: GetIt.I.get<SecureStorage>()));

    getIt.registerSingleton<LoginDataSourceAbstract>(
        LoginDataSourceImpl(restClient: GetIt.I.get<RestClient>()));

    getIt.registerSingleton<LoginRepositoryAbstract>(LoginRepositoryImpl(
        loginDataSource: GetIt.I.get<LoginDataSourceAbstract>(),
        secureStorage: GetIt.I.get<SecureStorage>()));
    getIt.registerSingleton(LoginStore());

    getIt.registerFactory(() => LoginController(
        store: LoginStore(),
        loginRepository: GetIt.I.get<LoginRepositoryAbstract>()));

    getIt.registerFactory(() => AppInitialController(
          store: AppInitialStore(),
          secureStorage: GetIt.I.get<SecureStorage>(),
        ));
  }
}
