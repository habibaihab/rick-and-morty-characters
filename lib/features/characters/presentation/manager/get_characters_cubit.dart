import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_characters/core/network/api_service.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/base_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/remote_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/repository_implementation/get_characters_rep_imp.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_filters_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repository/get_characters_repo.dart';
import 'package:rick_and_morty_characters/features/characters/domain/use_cases/get_characters_use_case.dart';

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

  List<CharacterEntity> get charactersData => _charactersData;


  Future<void>getAllCharacters({
    CharacterFiltersEntity? filters,
  }) async{
    apiService = ApiService();
    baseDataSource = RemoteDataSource(apiService);
    getCharactersRepo = GetCharactersRepImp(baseDataSource);
    getCharactersUseCase = GetCharactersUseCase(getCharactersRepo);

    emit(LoadingGetCharacters());

    final result = await getCharactersUseCase.execute(filters);

    return result.fold(
        (error){
          emit(ErrorGetCharacters(error.message));
        },
        (data){
          if (data.isEmpty) {
            emit(GetCharactersEmpty());
          } else {
            _charactersData = data;
            emit(SuccessGetCharacters(_charactersData));
          }
        });
  }



}
