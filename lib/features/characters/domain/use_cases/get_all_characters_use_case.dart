import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repository/all_characters_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/character_entity.dart';

class GetAllCharactersUseCase {
  final AllCharactersRepo allCharactersRepo;

  GetAllCharactersUseCase(this.allCharactersRepo);

  Future<Either<Failure,List<CharacterEntity>>> execute() async{
    return await allCharactersRepo.getAllCharacters();

  }
}