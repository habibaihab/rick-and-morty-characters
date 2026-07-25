import 'package:dio/src/response.dart';
import 'package:rick_and_morty_characters/core/network/api_contants.dart';
import 'package:rick_and_morty_characters/core/network/api_service.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/base_data_source.dart';

import '../../domain/entities/character_filters_entity.dart';
import '../models/character_filters_model.dart';

class RemoteDataSource implements BaseDataSource{
  final ApiService apiService;

  RemoteDataSource(this.apiService);

  @override
  Future<Response> getCharacters(CharacterFiltersEntity? filters) async{
    return  await apiService.dio.get(ApiConstants.baseUrl+ApiConstants.allCharacters,
    queryParameters: filters?.toQueryParameters());

  }
}