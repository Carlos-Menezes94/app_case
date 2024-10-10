import 'package:app_random_numbers/app/core/data_source_response/data_source_response.dart';

abstract interface class LoginDataSourceAbstract {
  Future<DataSourceResponse> login(
      {required String email, required String password});
}
