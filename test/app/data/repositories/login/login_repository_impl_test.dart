import 'package:app_random_numbers/app/core/data_source_response/data_source_response.dart';
import 'package:app_random_numbers/app/core/failures/failure.dart';
import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:app_random_numbers/app/data/data_sources/login/login_data_source_abstract.dart';
import 'package:app_random_numbers/app/data/models/login_model.dart';
import 'package:app_random_numbers/app/data/models/token_model.dart';
import 'package:app_random_numbers/app/data/repositories/login/login_repository_impl.dart';
import 'package:app_random_numbers/app/domain/entities/login_entity.dart';
import 'package:app_random_numbers/app/domain/entities/token_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginDataSource extends Mock implements LoginDataSourceAbstract {}

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockLoginDataSource mockLoginDataSource;
  late LoginRepositoryImpl repository;
  late SecureStorage mockSecureStorage;

  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    mockSecureStorage = MockSecureStorage();
    repository = LoginRepositoryImpl(
        loginDataSource: mockLoginDataSource, secureStorage: mockSecureStorage);
  });

  group('LoginRepositoryImpl Tests', () {
    const email = 'eve.holt@reqres.in';
    const password = 'password123';
    test(
      'Should return Right when login is successful - loginWithEmailPassword Method',
      () async {
        final mockResponse = {'token': 'X123dadsSd24ds5'};
        when(() => mockLoginDataSource.login(email: email, password: password))
            .thenAnswer((_) async =>
                DataSourceResponse(data: mockResponse, hasSuccess: true));

        when(() => mockSecureStorage.saveEncryptedData(any(), any()))
            .thenAnswer((_) async => Future.value());

        final result = await repository.loginWithEmailPassword(
          loginEntity: LoginModel(email: email, password: password),
        );

        final resultFromJson = TokenModel.fromJson(mockResponse);
        expect(result, equals(Right<Failure, TokenEntity>(resultFromJson)));
      },
    );

    test(
        'Should return Left with error message when status code is 400  -  loginWithEmailPassword Method',
        () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: '/login'),
        response: Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: '/login'),
          data: {'error': 'Missing email or username'},
        ),
        type: DioExceptionType.badResponse,
      );

      when(() => mockLoginDataSource.login(email: email, password: password))
          .thenThrow(dioError);

      final result = await repository.loginWithEmailPassword(
          loginEntity: LoginModel(email: email, password: password));

      expect(
        result,
        equals(Left<Failure, LoginEntity>(Failure(
            message:
                'Erro ao tentar fazer o login: Missing email or username'))),
      );
    });

    test(
        'Should return Left with Missing password message when password is empty  -  loginWithEmailPassword Method',
        () async {
      when(() => mockLoginDataSource.login(
          email: any(named: 'email'),
          password: any(named: 'password'))).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/login'),
        response: Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: '/login'),
          data: {'error': 'Missing password'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await repository.loginWithEmailPassword(
          loginEntity: LoginModel(email: email, password: password));

      expect(
        result,
        equals(Left<Failure, LoginEntity>(Failure(
            message: 'Erro ao tentar fazer o login: Missing password'))),
      );
    });
    test(
        'Should return Left with Missing password message when user email not found  -  loginWithEmailPassword Method',
        () async {
      when(() => mockLoginDataSource.login(
          email: any(named: 'email'),
          password: any(named: 'password'))).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/login'),
        response: Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: '/login'),
          data: {'error': 'user not found'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await repository.loginWithEmailPassword(
          loginEntity: LoginModel(email: email, password: ''));

      expect(
        result,
        equals(Left<Failure, LoginModel>(
            Failure(message: 'Erro ao tentar fazer o login: user not found'))),
      );
    });
  });
}
