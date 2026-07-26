import 'package:dio/dio.dart';

import 'api_contants.dart';

class ApiService {

  final Dio dio;

  ApiService() :
        dio = Dio(
            BaseOptions(
              baseUrl: ApiConstants.baseUrl,
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
            )
        );
}