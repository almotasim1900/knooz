// --ONBOARDING PAGE---------------------------------------------

//الصفحة الاولي
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/onboarding/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/onboarding/onboardingwidget/custombuttononboardingwidget.dart';
import 'package:koosh/onboarding/onboardingwidget/dotscontrollerwidget.dart';
import 'package:koosh/onboarding/onboardingwidget/slideronboardingwidget.dart';

// --ONBOARDING--------------------------------------------------

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --PUT ONBOARDING CONTROLLER--------------------------------
    // حقن onboardingcontroller
    //F:\flutter\koosh\lib\controller\onboarding_dots_controller.dart
    Get.put(OnBoardingDotsControllerImp());

    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      // --BACKGROUND COLOR----------------------------------------
      //لون الخلفية
      backgroundColor: AppColors.white,

      // --SAFE AREA-----------------------------------------------
      body: SafeArea(
        child: Column(
          children: [
            // --SLIDER------------------------------------------------
            // الاكسباندد لتفصل الاجزاء المتحركة في صفحة الاقلاع
            const Expanded(
              flex: 3,
              child:
                  // F:\flutter\koosh\lib\view\widget\onboardingwidget\slideronboardingwidget.dart
                  SliderOnboardingWidget(),
            ),

            // --DOTS AND BUTTON--------------------------------------
            //الاكسباندد الثاني لاحتواء نقاط التنقل
            // F:\flutter\koosh\lib\view\widget\onboardingwidget\custombuttononboardingwidget.dart
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  // --DOTS------------------------------------------------
                  DotsControllerWidget(),

                  // --SPACER------------------------------------------------
                  Spacer(flex: 2),

                  // --CONTINUE BUTTON--------------------------------------
                  // الباتوم الخاص بالاسترار بين صفحات الاقلاع
                  // F:\flutter\koosh\lib\view\widget\onboardingwidget\custombuttononboardingwidget.dart
                  CustomButtonOnBoardingWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
