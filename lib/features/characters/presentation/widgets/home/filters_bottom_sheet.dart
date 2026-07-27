import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_filters_entity.dart';

import 'filter_chip_group.dart';

Future<CharacterFiltersEntity?> showFiltersBottomSheet(
    BuildContext context,{
      required CharacterFiltersEntity initialFilters,
}) {

  CharacterFiltersEntity filters = initialFilters;
  final nameController = TextEditingController(
    text: initialFilters.name,
  );

  final speciesController = TextEditingController(
    text: initialFilters.species,
  );

  final typeController = TextEditingController(
    text: initialFilters.type,
  );

  const List<String> statusOptions = [
    "alive",
    "dead",
    "unknown",
  ];

  const List<String> genderOptions = [
    "female",
    "male",
    "genderless",
    "unknown",
  ];

  return showModalBottomSheet<CharacterFiltersEntity>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.bgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24.r),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 20.h,
              bottom:
              MediaQuery.of(context).viewInsets.bottom + 20.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 45.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Center(
                    child: Text(
                      "Filters",
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  FilterChipGroup(
                    title: "Status",
                    options: statusOptions,
                    selectedValue: filters.status,
                    onSelected: (value) {
                      setState(() {
                        filters = filters.copyWith(
                          status: value,
                        );
                      });
                    },
                  ),

                  SizedBox(height: 25.h),

                  FilterChipGroup(
                    title: "Gender",
                    options: genderOptions,
                    selectedValue: filters.gender,
                    onSelected: (value) {
                      setState(() {
                        filters = filters.copyWith(
                          gender: value,
                        );
                      });
                    },
                  ),

                  SizedBox(height: 25.h),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16.sp
                      ),
                    ),
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16.sp
                    ),
                    onChanged: (value) {
                      filters = filters.copyWith(
                        name: value,
                      );
                    },
                  ),
                  SizedBox(height: 20.h),

                  TextField(
                    controller: speciesController,
                    decoration: InputDecoration(
                      labelText: "Species",
                      labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16.sp
                      ),
                    ),
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16.sp
                    ),
                    onChanged: (value) {
                      filters = filters.copyWith(
                        species: value,
                      );
                    },
                  ),

                  SizedBox(height: 20.h),

                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                      labelText: "Type",
                      labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16.sp
                      ),
                    ),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16.sp
                    ),
                    onChanged: (value) {
                      filters = filters.copyWith(
                        type: value,
                      );
                    },
                  ),

                  SizedBox(height: 35.h),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                filters = const CharacterFiltersEntity();

                                speciesController.clear();
                                typeController.clear();
                                nameController.clear();
                                Navigator.pop(context, filters);
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.unknownDim),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.unknownDim,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context, filters);
                            },
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}