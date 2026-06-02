import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/app_colors.dart';

class CustomTextStyle {
  static const TextStyle senBoldLarge = TextStyle(
    fontFamily: 'Sen',
    fontSize: 24,
    fontWeight: .bold,
    color: AppColors.largeTextColor,
  );
  static const TextStyle senNormalRegular = TextStyle(
    fontFamily: 'Sen',
    fontSize: 16,
    fontWeight: .normal,
    color: AppColors.smallTextColor,
  );
}
