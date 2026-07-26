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
    return Container(
      padding: EdgeInsets.all(0.8.r),
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        borderRadius: BorderRadius.circular(10.r),
        border: BoxBorder.all(color: AppColors.borderColor,width: 1.5.r)
      ),
      child: IconButton(
          onPressed: () async {
            final cubit = context.read<GetCharactersCubit>();
            final filters = await showFiltersBottomSheet(context,
              initialFilters: cubit.currentFilters
            );
            if (filters != null) {
              onApplyFilters(filters);
            }
          },
          icon: Icon(Icons.filter_list_alt,color: AppColors.textMuted,)),
    );
  }


}
