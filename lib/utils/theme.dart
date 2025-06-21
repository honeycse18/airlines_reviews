import 'package:airlines_review/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData appThemeData = ThemeData(
    useMaterial3: false,
    /*<-------Set default font name-------->*/
    // fontFamily: 'Nunito Sans 7pt',
    fontFamily: 'Plus Jakarta Sans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        color: AppColors.primaryButtonColor,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 15,
        color: AppColors.titleColor,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        color: AppColors.text2Color,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: AppColors.primaryButtonColor,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: AppColors.subtitleColor,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(color: AppColors.text2Color),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.textColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.textColor, width: 1),
      ),
    ),
    /*<--------Set default appbar theme------->*/
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: AppColors.primaryButtonColor),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Plus Jakarta Sans',
        color: AppColors.primaryButtonColor,
        fontWeight: FontWeight.w700,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      textStyle: TextStyle(
        color: AppColors.textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
