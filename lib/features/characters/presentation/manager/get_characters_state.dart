part of 'get_characters_cubit.dart';

@immutable
sealed class GetCharactersState {}

final class GetCharactersInitial extends GetCharactersState {}
final class LoadingGetCharacters extends GetCharactersState {}
class GetCharactersEmpty extends GetCharactersState {}
final class SuccessGetCharacters extends GetCharactersState {
  final List<CharacterEntity> charactersData;
  SuccessGetCharacters(this.charactersData);
}
final class ErrorGetCharacters extends GetCharactersState {
  final String errorMessage;
  ErrorGetCharacters(this.errorMessage);
}
