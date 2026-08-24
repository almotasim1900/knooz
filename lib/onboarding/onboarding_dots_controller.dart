import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/onboarding/onboarding_static.dart';
import 'package:koosh/services/services.dart';

abstract class OnBoardingDotsController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnBoardingDotsControllerImp extends OnBoardingDotsController {
  late PageController pageController;
  // متغير للاستماع لحالة التغير بالصفحة
  int currentPage = 0;

  // متغير لتخزين هل رئ المستخدم المقدمة ام لا
  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    //وضع شرط للدخول لصفحة تسجيل الدخول في حالة اكتمال صور المقدمة
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppsRoutesNames.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
