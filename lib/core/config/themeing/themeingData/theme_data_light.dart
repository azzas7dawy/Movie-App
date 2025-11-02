
import 'package:flutter/material.dart';
import 'package:maps_and_themeing/core/config/themeing/app_colors.dart';
import 'package:maps_and_themeing/core/config/themeing/app_fonts.dart';
import 'package:maps_and_themeing/core/config/themeing/app_text_styles.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.sky0,
    brightness: Brightness.light,
    fontFamily: AppFonts.manrope,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary0,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.grey700,
          displayColor: AppColors.grey700,
        ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary0,
    //     foregroundColor: AppColors.grey0,
    //     disabledBackgroundColor: AppColors.grey100,
    //     disabledForegroundColor: AppColors.grey0,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     textStyle: AppTextStyles.mSemiBold,
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: const BorderSide(
    //       color: AppColors.grey100,
    //     ),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: const BorderSide(
    //       color: AppColors.grey100,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     borderSide: const BorderSide(
    //       color: AppColors.primary200,
    //     ),
    //   ),
    //   fillColor: WidgetStateColor.resolveWith((states) {
    //     if (states.contains(WidgetState.focused)) {
    //       return AppColors.primary0;
    //     }
    //     return AppColors.grey0;
    //   }),
    //   filled: true,
    //   hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.grey400),
    // ),
  );
}
