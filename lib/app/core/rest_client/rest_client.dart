import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestClient {
  final Dio _dio;
  final SecureStorage _storage = SecureStorage();

  RestClient({
    required Dio dio,
  }) : _dio = dio {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.getEncryptedData('boxToken');
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
  }

  Dio get dioInstance => _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        options: options,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> patch({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioException e) {
    if (e.response != null) {
      debugPrint(
          'RestClient Erro: ${e.response?.statusCode} - ${e.response?.data}');
    } else {
      debugPrint('RestClient Erro: ${e.message}');
    }
  }
}
