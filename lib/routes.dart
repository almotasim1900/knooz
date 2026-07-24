//ادارة التنقل بين الصفحات
import 'package:flutter/material.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/view/screen/auth/login.dart';
import 'package:koosh/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // هذه الخطوة بعد تعريف الروت في الدالة بالرابط التالي
  //F:\flutter\koosh\lib\core\constant\routes_names.dart

  AppsRoutesNames.login: (context)=>const Login(),
    AppsRoutesNames.onBoarding: (context)=>const OnBoarding()


};

