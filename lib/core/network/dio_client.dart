import 'package:dio/dio.dart';

class DioClient {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = 'd6e25aa87090db0bfff7cc47ecb69053';

  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['api_key'] = _apiKey;
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // You can log or handle errors globally here
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}