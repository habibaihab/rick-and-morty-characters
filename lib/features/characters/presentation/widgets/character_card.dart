import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';

import '../../../../core/utils/status_color.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.characterData});

  final CharacterEntity characterData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        border: BoxBorder.all(
          color: AppColors.borderColor,
          width: 1.5.r,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(20.r),
            ),
            child: CachedNetworkImage(
              imageUrl: characterData.image,
              width: double.infinity,
              height: 170.h,
              placeholder: (context, url) {
                return Container(
                  height: 170.h,
                  color: AppColors.filledColor,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2.w),
                  ),
                );
              },
              errorWidget: (context, url, error) => Container(
                height: 170,
                color: AppColors.filledColor,
                child: const Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5.r,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(characterData.name,style: GoogleFonts.rajdhani(
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold
              ),overflow: TextOverflow.ellipsis,
                  maxLines: 1,),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: getStatusColor(characterData.status),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "${characterData.status} • ${ characterData.species}",style: GoogleFonts.poppins(
                      color: AppColors.textMuted,
                    ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
                Text(
                  characterData.type,style: GoogleFonts.poppins(
                    color: AppColors.textMuted
                ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            ],),
          )
        ],
      ),
    );
  }
}
