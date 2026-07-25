import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_characters/core/errors/failure.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_filters_entity.dart';

abstract class GetCharactersRepo {
  Future<Either<Failure,List<CharacterEntity>>> getCharacters(CharacterFiltersEntity? filters);
}