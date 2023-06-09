import 'package:flutter/material.dart';

import '../../app/resources/app_fonts.dart';
import '../style/app_styles.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: AppColors.mainColor,
    fontFamily: AppFonts.poppinsRegular,
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
            backgroundColor: AppColors.lightGray, iconSize: 10)),
    appBarTheme: const AppBarTheme(
      color: AppColors.colorWhite, elevation: 0.0),
    scaffoldBackgroundColor: AppColors.extraLightGray,
    inputDecorationTheme: inputDecorationTheme(),
    bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
      backgroundColor: AppColors.extraLightGray,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.lightGray,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)
    ),
     ),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    fillColor: AppColors.colorWhite,
    filled: true,
    enabledBorder: AppStyles.outlineInputBorder(),
    border: AppStyles.outlineInputBorder(),
    focusedBorder: AppStyles.outlineInputBorder(color: AppColors.grey),
    errorBorder: AppStyles.outlineInputBorder(color: AppColors.mainColor),
    focusedErrorBorder: AppStyles.outlineInputBorder(color: AppColors.mainColor),
  );
}