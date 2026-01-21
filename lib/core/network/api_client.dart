import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          // connectTimeout: const Duration(seconds: 30),
          // receiveTimeout: const Duration(seconds: 30),
          headers: {"Content-Type": "application/json"},
        ),
      ) {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        logPrint: (data) => print(data),
        request: true,
      ),
    );
  }

  Dio get dio => _dio;
}
