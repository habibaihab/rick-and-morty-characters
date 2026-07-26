import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/status_color.dart';

class CharacterHeader extends StatelessWidget {
  const CharacterHeader({super.key, required this.character});
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.vertical(
              bottom: Radius.circular(36.r),
            ),
            child: CachedNetworkImage(
              imageUrl: character.image,
              width: double.infinity,
              height: 360.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 360.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(36.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  AppColors.bgColor.withValues(alpha: 0.55),
                  AppColors.bgColor,
                ],
                stops: const [0.0, 0.55, 0.85, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 18,
            child: Column(
              children: [
                Text(
                  character.name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: 8.h),
                Container(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 14.r, vertical: 6.r),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: getStatusColor(character.status),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: getStatusColor(character.status)
                                  .withValues(alpha: 0.7),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                       SizedBox(width: 8.w),
                      Text(
                        "${character.status} • ${character.species}",
                        style: GoogleFonts.poppins(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
