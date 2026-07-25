import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: AppColors.textMuted,
        fontSize: 16.sp
      ),
      decoration: InputDecoration(
        hintText: "Search characters...",
        hintStyle: GoogleFonts.inter(
          color: AppColors.textMuted,
          fontSize: 16.sp,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.textMuted,
        ),
        filled: true,
        fillColor: AppColors.filledColor,
        contentPadding:  EdgeInsets.symmetric(
          vertical: 16.r,
          horizontal: 16.r,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1.5.w,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:BorderSide(
            color:AppColors.aliveDim,
            width:1.5.r,
          ),
        ),
      ),
    );
  }
}
