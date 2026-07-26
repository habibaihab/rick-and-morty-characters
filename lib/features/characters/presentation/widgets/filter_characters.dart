import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/manager/get_characters_cubit.dart';

import '../../domain/entities/character_filters_entity.dart';
import 'filters_bottom_sheet.dart';

class FilterCharacters extends StatelessWidget {
  const FilterCharacters({super.key, required this.onApplyFilters});
  final ValueChanged<CharacterFiltersEntity> onApplyFilters;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GetCharactersCubit>();
    final filtersCount = cubit.currentFilters.filtersCount;

    return Container(
      padding: EdgeInsets.all(0.8.r),
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: filtersCount > 0
              ? AppColors.unknown
              : AppColors.borderColor,
          width: 1.5.r,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            onPressed: () async {
              final filters = await showFiltersBottomSheet(
                context,
                initialFilters: cubit.currentFilters,
              );

              if (filters != null) {
                onApplyFilters(filters);
              }
            },
            icon: Icon(
              Icons.filter_list_alt,
              color: AppColors.textMuted,
            ),
          ),

          if (filtersCount > 0)
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 18.w,
                height: 18.w,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "$filtersCount",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }


}
