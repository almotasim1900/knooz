import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/onboarding_controller/onboarding_dots_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/data/datasource/static/onboarding_static.dart';

class SliderOnboardingWidget extends GetView<OnBoardingDotsControllerImp> {
  const SliderOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      // الدالة التالية لحفظ قيمة التغير بصفحة الاقلاع
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
            onBoardingList[i].title!,
            style:const TextStyle(),
          ),
          const SizedBox(height: 50),
          //صور صفحة الاقلاع
          Image.asset(
            onBoardingList[i].image!,
            height: 270,
            width: 230,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 50),
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
