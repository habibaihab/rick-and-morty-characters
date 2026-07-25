import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_characters/core/errors/failure.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';

abstract class AllCharactersRepo {
  Future<Either<Failure,List<CharacterEntity>>> getAllCharacters();
}