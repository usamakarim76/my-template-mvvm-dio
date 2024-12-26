import 'package:flutter/material.dart';
import 'package:my_template/config/resources/colors.dart';

class AppFonts {
  static bodyFont(
      {var color,
      var fontSize,
      var fontWeight,
      var fontStyle,
      var letterSpacing,
      var height,
      var decoration}) {
    return TextStyle(
      fontFamily: 'Poppins',
      height: height,
      color: color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontSize: fontSize?.toDouble(),
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}

class AppTextTheme {
  static TextTheme textTheme = TextTheme(
    /// Bold
    titleLarge: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 23.sp,
      fontWeight: FontWeight.w800,
    ),
    titleMedium: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
    ),

    /// Semi Bold
    titleSmall: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    ),

    /// Medium
    bodyLarge: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 23.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    ),

    /// Regular
    bodySmall: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
    ),

    /// Light
    labelLarge: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 23.sp,
      fontWeight: FontWeight.w100,
    ),
    labelMedium: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w100,
    ),
    labelSmall: AppFonts.bodyFont(
      color: AppColors.kPrimaryColor,
      fontSize: 11.sp,
      fontWeight: FontWeight.w100,
    ),
  );
}
