// هذا الملف لفتح لغة التطبيق بلغة الجهاز مع خيار تغير اللغة من داخل التطبيق
import 'dart:ui';
import 'package:get/get.dart';
import 'package:koosh/services/services.dart';
// بعد الانتهاء من الكلاس بتحقن في main

class LanguageControllerPage extends GetxController {
  // متغير لحفظ لغة الجهاز الحالية
  Locale? initlanguage;
  MyServices myServices = Get.find();

  void changelanguage(String languagecode) {
    Locale locale = Locale(languagecode);
    myServices.sharedPreferences.setString("language", languagecode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreferenceslanguage = myServices.sharedPreferences.getString(
      'language',
    );
    if (sharedPreferenceslanguage == 'ar') {
      initlanguage = const Locale('ar');
    } else if (sharedPreferenceslanguage == 'en') {
      initlanguage = const Locale('en');
    } else {
      // إعطاء لغة افتراضية من الجهاز إذا لم يقم المستخدم بالاختيار سابقاً
      initlanguage = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
