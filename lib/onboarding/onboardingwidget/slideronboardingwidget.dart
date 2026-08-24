import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/onboarding/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/onboarding/onboarding_static.dart';

// --SLIDER ONBOARDING WIDGET------------------------------------

class SliderOnboardingWidget extends GetView<OnBoardingDotsControllerImp> {
  const SliderOnboardingWidget({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --PAGE VIEW------------------------------------------------
    return PageView.builder(
      controller: controller.pageController,

      // --PAGE CHANGED--------------------------------------------
      // الدالة التالية لحفظ قيمة التغير بصفحة الاقلاع
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },

      // --ITEM COUNT----------------------------------------------
      itemCount: onBoardingList.length,

      // --ITEM BUILDER--------------------------------------------
      itemBuilder: (context, i) => Column(
        children: [
          // --ONBOARDING IMAGE------------------------------------
          //صور صفحة الاقلاع
          Image.asset(
            onBoardingList[i].image!,
            height: 270,
            // width: 230,
            fit: BoxFit.fill,
          ),

          // --SPACE------------------------------------------------
          const SizedBox(height: 20),

          // --ONBOARDING TITLE------------------------------------
          Text(onBoardingList[i].title!, style: const TextStyle()),

          // --SPACE------------------------------------------------
          const SizedBox(height: 50),

          // --BODY CONTAINER--------------------------------------
          // حاوية خاصة بالنص تحت صور صفحة الاقلاع لاعطاءها بعض الخصائص
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.gray,
                height: 2,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
