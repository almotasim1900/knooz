import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: 'PlayfairDisplay',
            textTheme: const TextTheme(
              // انواع الخطوط بالتطبيق
              // الخط الاول
              headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.black,
              ),
              // الخط الثاني
              // الخط الثالث
              bodySmall: TextStyle(
                color: AppColors.gray,
                height: 2,
                fontSize: 14,
              ),
              // الخط الرابع
              bodyMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 26,
              ),
            ),
            primarySwatch: Colors.blue,
          );

ThemeData arabicTheme = ThemeData(
  fontFamily: 'Cairo',
            textTheme: const TextTheme(
              // انواع الخطوط بالتطبيق
              // الخط الاول
              headlineLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.black,
              ),
              // الخط الثاني
              bodyLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.gray,
                height: 2,
                fontSize: 17,
              ),
              // الخط الثالث
              bodySmall: TextStyle(
                color: AppColors.gray,
                height: 2,
                fontSize: 14,
              ),
              // الخط الرابع
              bodyMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 26,
              ),
            ),
            primarySwatch: Colors.blue,
          );