import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'alive':
      return AppColors.alive;
    case 'dead':
      return AppColors.dead;
    case 'unknown':
      return AppColors.unknown;
    default:
      return Colors.red;
  }
}