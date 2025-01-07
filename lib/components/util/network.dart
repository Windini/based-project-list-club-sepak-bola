import 'package:dio/dio.dart';

class Network {
  static Dio dioClient() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(seconds: 40),
    );
    final Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true, requestHeader: true));
    return dio;
  }
}

class UnauthorizedException implements Exception {}