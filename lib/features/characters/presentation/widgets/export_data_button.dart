import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/services/export_data_service/excel_export_service.dart';

import '../../../../core/constants/app_colors.dart';
import '../manager/get_characters_cubit.dart';

class ExportDataButton extends StatelessWidget {
  const ExportDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetCharactersCubit>();
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.unknown,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10.r))

        ),
        onPressed: () async{
          await ExcelExportService().exportCharactersData(
            cubit.charactersData
          );

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.save_alt_rounded,color:Colors.black,size: 25.r,),
            SizedBox(width: 10.r,),
            Text(
              "Export to (.XLSX)".toUpperCase() ,
              style: GoogleFonts.inter(
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
