import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/bindings/intialbindings.dart';
import 'package:koosh/core/localizations/changelanguage.dart';
import 'package:koosh/core/localizations/translation.dart';
import 'package:koosh/routes.dart';
import 'package:koosh/services/services.dart';

// --MAIN--------------------------------------------------------

void main() async {
  // --INITIALIZE FLUTTER----------------------------------------
  // استدعاء الشيردبرفرنس حتي يشتغل مع اقلاع التطبيق
  WidgetsFlutterBinding.ensureInitialized();

  // --INITIAL SERVICES------------------------------------------
  await initialServices();

  // --RUN APP---------------------------------------------------
  runApp(const MyApp());
}

// --MY APP------------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --LANGUAGE CONTROLLER--------------------------------------
    // الحقن لاستخدام اللغة
    LanguageControllerPage controller = Get.put(LanguageControllerPage());

    // --GET MATERIAL APP-----------------------------------------
    return GetMaterialApp(
      // --TRANSLATIONS--------------------------------------------
      // استدعاء دالة الترجمة
      translations: MyTranslation(),

      // --DEBUG BANNER--------------------------------------------
      debugShowCheckedModeBanner: false,

      // --APP TITLE-----------------------------------------------
      title: 'Flutter Demo',

      // --LANGUAGE-----------------------------------------------
      locale: controller.initlanguage,

      // --THEME--------------------------------------------------
      theme: controller.appTheme,

      // --INITIAL BINDING----------------------------------------
      initialBinding: Intialbindings(),

      // --ROUTES-------------------------------------------------
      // ادارة التنقل بين الصفحات
      getPages: routes,
    );
  }
}
