import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/onboarding_controller/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';

class CustomButtonOnBoardingWidget
    extends GetView<OnBoardingDotsControllerImp> {
  const CustomButtonOnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),

      height: 40,
      child: MaterialButton(
        textColor: AppColors.white,
        color: AppColors.primerycolor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        child: Text('continue'.tr),
        onPressed: () {
          // مربطة بالدوت عند الضغط
          controller.next();
        },
      ),
    );
  }
}
