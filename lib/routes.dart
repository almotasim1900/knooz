//ادارة التنقل بين الصفحات
import 'package:flutter/material.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/view/screen/auth/forget_password/forget_password.dart';
import 'package:koosh/view/screen/auth/forget_password/vrefiycodesignup.dart';
import 'package:koosh/view/screen/auth/login.dart';
import 'package:koosh/view/screen/auth/registration_screen.dart';
import 'package:koosh/view/screen/auth/forget_password/rest_password.dart';
import 'package:koosh/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:koosh/view/screen/auth/success_signup.dart';
import 'package:koosh/view/screen/auth/forget_password/vrefiy_code.dart';
import 'package:koosh/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // هذه الخطوة بعد تعريف الروت في الدالة بالرابط التالي
  //F:\flutter\koosh\lib\core\constant\routes_names.dart
  // onboarding
  AppsRoutesNames.onBoarding: (context) => const OnBoarding(),
  // auth
  AppsRoutesNames.login: (context) => const Login(),
  AppsRoutesNames.registrationScreen: (context) => const RegistrationScreen(),
  AppsRoutesNames.forgetPassword: (context) => const ForgetPassword(),
    AppsRoutesNames.verfiyCode: (context) => const VrefiyCode(),
  AppsRoutesNames.reSetPassword: (context) => const RestPassword(),
    AppsRoutesNames.successResetPassword: (context) => const SuccessResetPassword(),
  AppsRoutesNames.successSignup: (context) => const SuccessSignUp(),
        AppsRoutesNames.vrefiyCodeSignUp: (context) => const Vrefiycodesignup(),




};
