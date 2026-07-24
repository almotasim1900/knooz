import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:koosh/controller/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/data/datasource/static/onboarding_static.dart';

class DotsControllerWidget extends StatelessWidget {
  const DotsControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingDotsControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ربط عدد النقاط بعدد عناصر صغحة الاقلاع
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              height: 6,
              // لتغير حجم الدوت التي نقف عليها الي 20
              width: controller.currentPage==index?20:5,
              decoration: BoxDecoration(
                color: AppColors.primerycolor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
