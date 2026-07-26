import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/widgets/character_details/character_details_grid.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/widgets/character_details/character_header.dart';

import '../widgets/character_details/large_info_card.dart';
import '../widgets/character_details/section_title.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.r, top: 4.r),
          child: CircleAvatar(
            backgroundColor: Colors.black.withValues(alpha: 0.35),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 18.sp,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CharacterHeader(character: character),
            Padding(
              padding: EdgeInsets.fromLTRB(20.r, 26.r, 20.r, 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: "Details"),
                  SizedBox(height: 14.h),

                  CharacterDetailsGrid(character: character),

                  SizedBox(height: 26.h),
                  SectionTitle(title: "Location"),
                  SizedBox(height: 14.h),

                  LargeInfoCard(
                    icon: Icons.public_rounded,
                    title: "Origin",
                    value: character.origin,
                    accentColor: const Color(0xFF6C63FF),
                  ),

                  SizedBox(height: 14.h),

                  LargeInfoCard(
                    icon: Icons.location_on_rounded,
                    title: "Last Known Location",
                    value: character.location,
                    accentColor: const Color(0xFF00C2A8),
                  ),

                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
