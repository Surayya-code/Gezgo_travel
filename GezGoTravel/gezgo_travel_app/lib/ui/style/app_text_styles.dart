
import 'package:flutter/material.dart';
import '../../app/resources/app_fonts.dart';
import '../theme/app_colors.dart';

class AppTextStyle {
  static TextStyle boardingFirstText = const TextStyle(
    fontSize: 25,
    color: AppColors.colorWhite,
    fontWeight: FontWeight.bold,
    height: 1.47,
    fontFamily: AppFonts.poppinsRegular,
  );

   static TextStyle boardingSecondText = const TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.italic,
    color: AppColors.colorWhite,
    height: 1.47,
    fontFamily: AppFonts.poppinsRegular,
  );

  static TextStyle boardingButton = const TextStyle(
    fontSize: 16,
    color: AppColors.colorWhite,
    height: 1.47,
    fontFamily: AppFonts.poppinsRegular,
  );

}