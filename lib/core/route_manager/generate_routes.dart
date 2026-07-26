

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_characters/core/route_manager/routes_names.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/manager/get_characters_cubit.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/screens/character_details.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/screens/home_screen.dart';

import '../../features/characters/domain/entities/character_entity.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutesNames.home,
    routes: [
      GoRoute(path: RoutesNames.home,
        builder: (context, state) => BlocProvider(
          create:(context) =>  GetCharactersCubit(),child:HomeScreen() ,
      ),
      ),

      GoRoute(path: RoutesNames.characterDetails ,
      builder: (context, state) {
        final character = state.extra as CharacterEntity;
        return CharacterDetails(character: character);

      },)

    ]);