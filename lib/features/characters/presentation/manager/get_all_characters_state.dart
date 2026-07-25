part of 'get_all_characters_cubit.dart';

@immutable
sealed class GetAllCharactersState {}

final class GetAllCharactersInitial extends GetAllCharactersState {}
final class LoadingGetAllCharacters extends GetAllCharactersState {}
class GetAllCharactersEmpty extends GetAllCharactersState {}
final class SuccessGetAllCharacters extends GetAllCharactersState {
  final List<CharacterEntity> charactersData;
  SuccessGetAllCharacters(this.charactersData);
}
final class ErrorGetAllCharacters extends GetAllCharactersState {
  final String errorMessage;
  ErrorGetAllCharacters(this.errorMessage);
}
