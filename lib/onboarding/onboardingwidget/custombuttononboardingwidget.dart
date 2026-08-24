import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/onboarding/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';

// --CUSTOM BUTTON ONBOARDING WIDGET-----------------------------

class CustomButtonOnBoardingWidget
    extends GetView<OnBoardingDotsControllerImp> {
  const CustomButtonOnBoardingWidget({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTAINER------------------------------------------------
    return Container(
      margin: const EdgeInsets.only(bottom: 30),

      // --HEIGHT-------------------------------------------------
      height: 40,

      // --MATERIAL BUTTON-----------------------------------------
      child: MaterialButton(
        textColor: AppColors.white,
        color: AppColors.primerycolor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),

        // --BUTTON TEXT-------------------------------------------
        child: Text('continue'.tr),

        // --ON PRESSED--------------------------------------------
        onPressed: () {
          // --NEXT PAGE-------------------------------------------
          // مربطة بالدوت عند الضغط
          controller.next();
        },
      ),
    );
  }
}
