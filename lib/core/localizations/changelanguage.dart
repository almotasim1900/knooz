// هذا الملف لفتح لغة التطبيق بلغة الجهاز مع خيار تغير اللغة من داخل التطبيق
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/app_themes.dart';
import 'package:koosh/services/services.dart';
// بعد الانتهاء من الكلاس بتحقن في main

class LanguageControllerPage extends GetxController {
  // متغير لحفظ لغة الجهاز الحالية
  Locale? initlanguage;
  MyServices myServices = Get.find();
  //متغير التبديل بين اللغتين
  ThemeData appTheme = englishTheme;

  void changelanguage(String languagecode) {
    Locale locale = Locale(languagecode);
    myServices.sharedPreferences.setString("language", languagecode);
    appTheme = initlanguage == 'ar' ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreferenceslanguage = myServices.sharedPreferences.getString(
      'language',
    );
    if (sharedPreferenceslanguage == 'ar') {
      initlanguage = const Locale('ar');
      appTheme = arabicTheme;
    } else if (sharedPreferenceslanguage == 'en') {
      initlanguage = const Locale('en');
            appTheme = englishTheme;

    } else {
      // إعطاء لغة افتراضية من الجهاز إذا لم يقم المستخدم بالاختيار سابقاً
      initlanguage = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
