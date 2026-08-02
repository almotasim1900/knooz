import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/localizations/changelanguage.dart';
import 'package:koosh/core/localizations/translation.dart';
import 'package:koosh/routes.dart';
import 'package:koosh/services/services.dart';

void main() async {
  // استدعاء الشيردبرفرنس حتي يشتغل مع اقلاع التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // الحقن لاستخدام اللغة
    LanguageControllerPage controller = Get.put(LanguageControllerPage());

    return GetMaterialApp(
      // استدعاء دالة الترجمة
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.initlanguage,
      theme: controller.appTheme,

      // ادارة التنقل بين الصفحات
      getPages: routes,
    );
  }
}
