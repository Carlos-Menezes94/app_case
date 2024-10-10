import 'package:app_random_numbers/app/core/data_source_response/data_source_response.dart';
import 'package:app_random_numbers/app/core/rest_client/rest_client.dart';
import 'package:app_random_numbers/app/data/data_sources/login/login_data_source_abstract.dart';

class LoginDataSourceImpl implements LoginDataSourceAbstract {
  final RestClient restClient;

  LoginDataSourceImpl({required this.restClient});
  @override
  Future<DataSourceResponse> login(
      {required String email, required String password}) async {
    final response = await restClient.post(
      'https://reqres.in/api/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return DataSourceResponse(
        data: response.data, hasSuccess: response.statusCode == 200);
  }
}
