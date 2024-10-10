import 'package:app_random_numbers/app/core/secure/secure_storage.dart';
import 'package:dio/dio.dart';

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
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _dio.get(path,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress}) async {
    return _dio.post(path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress);
  }

  Future<Response> delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    return _dio.delete(path,
        data: data,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters);
  }

  Future<Response> patch({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _dio.patch(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }
}
