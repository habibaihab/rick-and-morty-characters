import 'package:dio/dio.dart';
import 'package:rick_and_morty_characters/features/characters/data/models/character_filters_model.dart';

import '../../domain/entities/character_filters_entity.dart';

abstract class BaseDataSource {
  Future<Response> getCharacters(CharacterFiltersEntity? filters);
}