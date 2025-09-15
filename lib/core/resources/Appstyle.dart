import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_final_project/core/resources/ColorsManager.dart';

class AppStyles {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkbackgroundcolor,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primarycolor),

    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.whitecolor,
      ),

      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.whitecolor,
      ),

      bodyLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManager.darkbackgroundcolor
      ),

      headlineLarge: TextStyle(color: ColorsManager.whitecolor,
      fontWeight: FontWeight.bold,

      fontSize: 50.sp)

    ),
  );
}
