import 'package:app_random_numbers/app/domain/repositories/exam_api_repository_abstract.dart';
import 'package:app_random_numbers/app/data/repositories/exam_api_repository_impl.dart';
import 'package:app_random_numbers/app/ui/home/controllers/home_controller.dart';
import 'package:app_random_numbers/app/ui/home/stores/home_store.dart';
import 'package:get_it/get_it.dart';

class DependecyInjector {
  static void start() {
    GetIt getIt = GetIt.instance;

    getIt.registerSingleton<ExamApiRepositoryAbstract>(ExamApiImpl());

    getIt.registerSingleton(HomeStore());

    getIt.registerFactory(() => HomeController(
          homeStore: GetIt.I.get<HomeStore>(),
          examApiRepository: GetIt.I.get<ExamApiRepositoryAbstract>(),
        ));
  }
}
