import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/localizations/changelanguage.dart';
import 'package:koosh/core/localizations/translation.dart';
import 'package:koosh/routes.dart';
import 'package:koosh/services/services.dart';
import 'package:koosh/view/screen/language_screen.dart';

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
    // نستخدم GetBuilder مباشرة دون الحاجة لـ Get.put فوقه
    return GetBuilder<LanguageControllerPage>(
      init:
          LanguageControllerPage(), // ضع الـ init هنا لضمان حقن الكنترولر أول مرة
      builder: (controller) {
        // التحقق من اللغة الحالية لتحديد اسم الخط المناسب
        bool isArabic = Get.locale?.languageCode == 'ar';
        String currentFont = isArabic ? 'ElMessiri' : 'PlayfairDisplay';

        return GetMaterialApp(
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          locale: controller
              .initlanguage, // استخدام الكنترولر القادم من الـ builder بأمان
          theme: ThemeData(
            fontFamily: currentFont,
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
          ),
          home: const LanguageaScreen(),
          routes: routes,
        );
      },
    );
  }
}
