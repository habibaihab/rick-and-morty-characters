import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import '../../../../../core/services/export_data_service/excel_export_service.dart';
import 'export_tile.dart';

class ExportBottomSheet extends StatelessWidget {
  const ExportBottomSheet({
    super.key,
    required this.characters,
  });

  final List<CharacterEntity> characters;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Export Characters",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 20.h),

            ExportTile(
              icon: Icons.download_rounded,
              title: "Save to Device",
              subtitle: "Save Excel file on your phone",
              onTap: () async {
                Navigator.pop(context);

                await ExcelExportService()
                    .saveCharactersData(characters);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("File saved successfully"),
                    ),
                  );
                }
              },
            ),

            SizedBox(height: 12.h),

            ExportTile(
              icon: Icons.share_rounded,
              title: "Share File",
              subtitle: "Share the generated Excel file",
              onTap: () async {
                Navigator.pop(context);

                await ExcelExportService()
                    .shareCharactersData(characters);
              },
            ),
          ],
        ),
      ),
    );
  }
}