import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/base_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/remote_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/repository_implementation/get_characters_rep_imp.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_filters_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repository/get_characters_repo.dart';
import 'package:rick_and_morty_characters/features/characters/domain/use_cases/get_characters_use_case.dart';

import '../../../../core/services/network_service/api_service.dart';


part 'get_characters_state.dart';

class GetCharactersCubit extends Cubit<GetCharactersState> {
  GetCharactersCubit() : super(GetCharactersInitial()){
    getAllCharacters();
  }

  late GetCharactersUseCase getCharactersUseCase;
  late  GetCharactersRepo getCharactersRepo;
  late  BaseDataSource baseDataSource;
  late  ApiService apiService;

  List<CharacterEntity> _charactersData = [];
  List<CharacterEntity> _allCharactersData = [];

  List<CharacterEntity> get charactersData => _charactersData;
  List<CharacterEntity> get allCharactersData => _allCharactersData;

  CharacterFiltersEntity currentFilters = const CharacterFiltersEntity();


  Future<void>getAllCharacters({
    CharacterFiltersEntity? filters,
  }) async{
    currentFilters = filters ?? const CharacterFiltersEntity();

    apiService = ApiService();
    baseDataSource = RemoteDataSource(apiService);
    getCharactersRepo = GetCharactersRepImp(baseDataSource);
    getCharactersUseCase = GetCharactersUseCase(getCharactersRepo);

    emit(LoadingGetCharacters());

    final result = await getCharactersUseCase.execute(currentFilters);

    return result.fold(
        (error){
          emit(ErrorGetCharacters(error.message));
        },
        (data){
          if (data.isEmpty) {
            emit(GetCharactersEmpty());

          } else {
            _charactersData = data;
            _allCharactersData =data;
            emit(SuccessGetCharacters(_charactersData));
          }
        });
  }

  void searchCharacters(String searchText) {
    if (searchText.trim().isEmpty) {
      _charactersData = _allCharactersData;
    } else {
      _charactersData = _allCharactersData.where((character) {
        return character.name
            .toLowerCase()
            .contains(searchText.toLowerCase());
      }).toList();
      if(_charactersData.isEmpty){
        emit(GetCharactersEmpty());
        return;
      }
    }

    emit(SuccessGetCharacters(_charactersData));
  }



}
