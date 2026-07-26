import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';

class FilterChipGroup extends StatelessWidget {
  const FilterChipGroup({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });

  final String title;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 12.h),

        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: options.map((option) {
            final bool isSelected = selectedValue == option;

            return ChoiceChip(
              label: Text(
                _capitalize(option),
                style: GoogleFonts.poppins(
                  color: isSelected
                      ? Colors.white
                      : AppColors.textPrimary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              selected: isSelected,

              onSelected: (_) {
                if (isSelected) {
                  onSelected(null);
                } else {
                  onSelected(option);
                }
              },

              backgroundColor: AppColors.filledColor,

              selectedColor: AppColors.unknownDim,

              side: BorderSide(
                color: isSelected
                    ? AppColors.unknown
                    : AppColors.borderColor,
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),

              showCheckmark: false,

              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _capitalize(String value) {
    return value[0].toUpperCase() + value.substring(1);
  }
}