import 'dart:convert';

import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:app_random_numbers/app/data/models/token_model.dart';
import 'package:app_random_numbers/app/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/failures/failure.dart';
import '../../../domain/entities/token_entity.dart';
import '../../../domain/repositories/login/login_repository_abstract.dart';
import '../../data_sources/login/login_data_source_abstract.dart';

class LoginRepositoryImpl implements LoginRepositoryAbstract {
  final LoginDataSourceAbstract loginDataSource;
  final SecureStorage secureStorage;

  LoginRepositoryImpl(
      {required this.loginDataSource, required this.secureStorage});

  @override
  Future<Either<Failure, TokenEntity>> loginWithEmailPassword(
      {required LoginEntity loginEntity}) async {
    try {
      final response = await loginDataSource.login(
          email: loginEntity.email, password: loginEntity.password);
      final tokenModel = TokenModel.fromJson(response.data);

      await secureStorage.saveEncryptedData(
          'boxToken', jsonEncode(response.data));

      return Right(tokenModel);
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        return Left(Failure(message: error.response?.data['error']));
      }
      return Left(Failure(message: error.toString()));
    }
  }
}
