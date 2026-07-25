import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/manager/get_all_characters_cubit.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/widgets/character_grid_view.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 2.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore Characters".toUpperCase(),
                style: GoogleFonts.rajdhani(
                  color: AppColors.textPrimary,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Browse, search and discover every Rick & Morty character.",
                style: GoogleFonts.poppins(
                  color: AppColors.textDim,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 20.h),
              SearchTextField(),
              SizedBox(height: 15.h),
              Expanded(
                child:
                    BlocBuilder<GetAllCharactersCubit, GetAllCharactersState>(
                      builder: (context, state) {
                        if (state is LoadingGetAllCharacters) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is ErrorGetAllCharacters) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.wifi_off,
                                  size: 60,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  state.errorMessage,
                                  style: GoogleFonts.rajdhani(
                                    color: AppColors.textPrimary,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<GetAllCharactersCubit>()
                                        .getAllCharacters();
                                  },
                                  child: Text(
                                    "Retry",
                                    style: GoogleFonts.rajdhani(
                                      color: AppColors.textDim,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        if (state is GetAllCharactersEmpty) {
                          return Center(
                            child: Text(
                              "No characters found",
                              style: GoogleFonts.rajdhani(
                                color: AppColors.textPrimary,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        if (state is SuccessGetAllCharacters) {
                          return CharacterGridView(
                            charactersList: state.charactersData,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
