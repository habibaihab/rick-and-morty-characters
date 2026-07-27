import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../manager/get_characters_cubit.dart';
import 'export_bottom_sheet.dart';

class ExportDataButton extends StatelessWidget {
  const ExportDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.unknown,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10.r))

        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColors.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.r),
              ),
            ),
            builder: (_) => ExportBottomSheet(
              characters: context.read<GetCharactersCubit>().charactersData,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save_alt_rounded,color:Colors.black,size: 25.r,),
            SizedBox(width: 10.r,),
            Text(
              "Export to (.XLSX)".toUpperCase() ,
              style: GoogleFonts.poppins(
                  color:Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
