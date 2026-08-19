import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/localizations/changelanguage.dart';
import 'package:koosh/view/widget/language/boutton_language_widget.dart';

// --LANGUAGE SCREEN---------------------------------------------

class LanguageaScreen extends GetView<LanguageControllerPage> {
  const LanguageaScreen({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      // --BODY----------------------------------------------------
      body: Container(
        padding: const EdgeInsets.all(15),

        // --COLUMN------------------------------------------------
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --CHOOSE LANGUAGE-----------------------------------
            Text(
              'choose_language'.tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            // --SPACE------------------------------------------------
            const SizedBox(height: 20),

            // --ARABIC BUTTON-------------------------------------
            // ذر اللغة الاول مع تنسقاته
            //F:\flutter\koosh\lib\core\localizations\changelanguage.dart
            BouttonLanguageWidget(
              textboutton: 'arabic'.tr,
              onPressed: () {
                controller.changelanguage('ar');

                // --GO TO ONBOARDING------------------------------
                // الانتقال لصفحة (onboarding )مع امكانية الرجوع
                Get.toNamed(AppsRoutesNames.onBoarding);
              },
            ),

            // --ENGLISH BUTTON------------------------------------
            BouttonLanguageWidget(
              textboutton: 'english'.tr,
              onPressed: () {
                controller.changelanguage('en');

                // --GO TO ONBOARDING------------------------------
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
