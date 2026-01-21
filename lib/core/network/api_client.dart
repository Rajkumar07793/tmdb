import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppConstants.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            queryParameters: {
              'api_key': AppConstants.apiKey,
            },
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Dio get dio => _dio;
}
