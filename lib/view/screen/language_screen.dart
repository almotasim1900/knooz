import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/localizations/changelanguage.dart';
import 'package:koosh/view/widget/language/boutton_language_widget.dart';

class LanguageaScreen extends GetView<LanguageControllerPage> {
  const LanguageaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('choose_language'.tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            // ذر اللغة الاول مع تنسقاته
            //F:\flutter\koosh\lib\core\localizations\changelanguage.dart
            BouttonLanguageWidget(
              textboutton: 'arabic'.tr,
              onPressed: () {
                controller.changelanguage('ar');
                // الانتقال لصفحة (onboarding )مع امكانية الرجوع
                Get.toNamed(AppsRoutesNames.onBoarding);
              },
            ),
            BouttonLanguageWidget(
              textboutton: 'english'.tr,
              onPressed: () {
                controller.changelanguage('en');
                 // الانتقال لصفحة (onboarding )مع امكانية الرجوع
                Get.toNamed(AppsRoutesNames.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
