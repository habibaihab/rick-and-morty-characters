import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_characters/core/errors/failure.dart';
import 'package:rick_and_morty_characters/core/errors/failure_handler.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/base_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_filters_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repository/get_characters_repo.dart';

class GetCharactersRepImp implements GetCharactersRepo{

  final BaseDataSource baseDataSource;

  GetCharactersRepImp(this.baseDataSource);



  @override
  Future<Either<Failure,List<CharacterEntity>>> getCharacters(CharacterFiltersEntity? filters) async {
    try{

      final List<CharacterEntity> charactersData = [];

      final response = await baseDataSource.getCharacters(filters);

      if(response.statusCode == 200){
        var data = response.data["results"];

        for(var ele in data){
         charactersData.add( CharacterModel.fromJson(ele));
        }
        return Right(charactersData);
      }else{

        return Left(ServerError("Unexpected response"));
      }

    }on DioException catch (dioException) {
      if (dioException.response?.statusCode == 404) {
        return const Right([]);
      }
      return Left(ServerError(getErrorMessage(dioException)));
    }


  }

}