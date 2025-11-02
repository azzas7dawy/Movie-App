
import 'package:flutter/material.dart';
import 'package:maps_and_themeing/core/config/themeing/app_colors.dart';
import 'package:maps_and_themeing/core/config/themeing/app_fonts.dart';
import 'package:maps_and_themeing/core/config/themeing/app_text_styles.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.grey700,
    brightness: Brightness.dark,
    fontFamily: AppFonts.manrope,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary0,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.primary0,
          displayColor: AppColors.primary0,
        ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primary300,
    //     foregroundColor: AppColors.grey0,
    //     disabledBackgroundColor: AppColors.grey800,
    //     disabledForegroundColor: AppColors.grey400,
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
    //       return AppColors.darkFillColor;
    //     }
    //     return AppColors.grey800;
    //   }),
    //   filled: true,
    //   hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.grey400),
    // ),
  );
}
