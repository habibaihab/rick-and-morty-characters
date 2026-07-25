import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repository/get_characters_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/character_entity.dart';
import '../entities/character_filters_entity.dart';

class GetCharactersUseCase {
  final GetCharactersRepo getCharactersRepo;

  GetCharactersUseCase(this.getCharactersRepo);

  Future<Either<Failure,List<CharacterEntity>>> execute(CharacterFiltersEntity? filters) async{
    return await getCharactersRepo.getCharacters(filters);

  }
}