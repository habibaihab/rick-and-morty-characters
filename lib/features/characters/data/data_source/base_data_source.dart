import 'package:dio/dio.dart';

abstract class BaseDataSource {
  Future<Response> getAllCharacters();
}