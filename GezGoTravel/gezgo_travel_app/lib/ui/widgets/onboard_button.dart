import 'package:flutter/material.dart';
import '../style/app_text_styles.dart';
import '../theme/app_colors.dart';

class OnBoardingButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const OnBoardingButton({
    super.key, 
     this.onTap, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onPressed: onTap,
      child: SizedBox(
        width: 343,
        height: 54,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyle.boardingButton,
          ),
        ),
      ),
    );
  }
}
