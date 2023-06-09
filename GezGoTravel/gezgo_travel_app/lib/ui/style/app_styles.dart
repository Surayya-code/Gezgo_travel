import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppStyles {
  static   OutlineInputBorder outlineInputBorder(
          {Color color = AppColors.grey}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );

  static final InputDecoration otpInputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 13.5),
    enabledBorder: otpOutlineInputBorder(),
    focusedBorder: AppStyles.outlineInputBorder(color: AppColors.grey),
    border: otpOutlineInputBorder(),
  );

  static OutlineInputBorder otpOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide:  const BorderSide(color: AppColors.grey),
    );
  }
}