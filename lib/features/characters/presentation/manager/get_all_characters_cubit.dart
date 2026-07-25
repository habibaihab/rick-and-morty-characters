import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_characters/core/network/api_service.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/base_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/data_source/remote_data_source.dart';
import 'package:rick_and_morty_characters/features/characters/data/repository_implementation/all_characters_rep_imp.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/domain/repository/all_characters_repo.dart';
import 'package:rick_and_morty_characters/features/characters/domain/use_cases/get_all_characters_use_case.dart';

part 'get_all_characters_state.dart';

class GetAllCharactersCubit extends Cubit<GetAllCharactersState> {
  GetAllCharactersCubit() : super(GetAllCharactersInitial()){
    getAllCharacters();
  }

  late GetAllCharactersUseCase getAllCharactersUseCase;
  late  AllCharactersRepo allCharactersRepo;
  late  BaseDataSource baseDataSource;
  late  ApiService apiService;

  List<CharacterEntity> _charactersData = [];

  List<CharacterEntity> get charactersData => _charactersData;


  Future<void>getAllCharacters() async{
    apiService = ApiService();
    baseDataSource = RemoteDataSource(apiService);
    allCharactersRepo = AllCharactersRepImp(baseDataSource);
    getAllCharactersUseCase = GetAllCharactersUseCase(allCharactersRepo);

    emit(LoadingGetAllCharacters());

    final result = await getAllCharactersUseCase.execute();

    return result.fold(
        (error){
          emit(ErrorGetAllCharacters(error.message));
        },
        (data){
          if (data.isEmpty) {
            emit(GetAllCharactersEmpty());
          } else {
            _charactersData = data;
            emit(SuccessGetAllCharacters(_charactersData));
          }
        });
  }



}
