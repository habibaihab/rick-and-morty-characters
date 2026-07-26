import 'package:dio/dio.dart';

import '../../domain/entities/character_filters_entity.dart';

abstract class BaseDataSource {
  Future<Response> getCharacters(CharacterFiltersEntity? filters);
}