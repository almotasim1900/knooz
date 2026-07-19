//الصفحة الاولي
import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/onboardingwidget/custombuttononboardingwidget.dart';
import 'package:koosh/view/widget/onboardingwidget/dotscontrollerwidget.dart';
import 'package:koosh/view/widget/onboardingwidget/slideronboardingwidget.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //لون الخلفية
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // الاكسباندد لتفصل الاجزاء المتحركة في صفحة الاقلاع
           const Expanded(
              flex: 3,
              child: 
              // F:\flutter\koosh\lib\view\widget\onboardingwidget\slideronboardingwidget.dart
               SliderOnboardingWidget()            ),
            //الاكسباندد الثاني لاحتواء نقاط التنقل
            // F:\flutter\koosh\lib\view\widget\onboardingwidget\custombuttononboardingwidget.dart
            Expanded(
              flex: 1,
              child: Column(
                children:const [
                 DotsControllerWidget(), 
                  Spacer(flex: 2),
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
