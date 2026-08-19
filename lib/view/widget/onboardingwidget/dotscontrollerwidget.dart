import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:koosh/controller/onboarding_controller/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/data/datasource/static/onboarding_static.dart';

// --DOTS CONTROLLER WIDGET--------------------------------------

class DotsControllerWidget extends StatelessWidget {
  const DotsControllerWidget({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --GET BUILDER----------------------------------------------
    return GetBuilder<OnBoardingDotsControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --GENERATE DOTS---------------------------------------
          // ربط عدد النقاط بعدد عناصر صغحة الاقلاع
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              // --DOT MARGIN--------------------------------------
              margin: const EdgeInsets.only(right: 5),

              // --ANIMATION DURATION-----------------------------
              duration: const Duration(milliseconds: 900),

              // --DOT HEIGHT--------------------------------------
              height: 6,

              // --DOT WIDTH---------------------------------------
              // لتغير حجم الدوت التي نقف عليها الي 20
              width: controller.currentPage == index ? 20 : 5,

              // --DOT DECORATION----------------------------------
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
