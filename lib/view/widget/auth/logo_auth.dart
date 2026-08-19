import 'package:flutter/material.dart';
import 'package:koosh/core/constant/app_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    // مسار صورة اللوقو
    //F:\flutter\koosh\lib\core\constant\onboardingimage.dart
    return Image.asset(AppAssets.logo, height: 170);
  }
}
