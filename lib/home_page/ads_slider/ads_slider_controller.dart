import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsSliderController extends GetxController {
  //============================================================
  // ADS IMAGES
  //============================================================

  final List<String> adsImages = [
    'assets/images/ads/ads1.jpg',
    'assets/images/ads/ads2.jpg',
    'assets/images/ads/ads3.jpg',
    'assets/images/ads/ads4.jpg',
    'assets/images/ads/ads5.jpg',
    'assets/images/ads/ads6.jpg',
    'assets/images/ads/ads7.jpg',
  ];

  //============================================================
  // PAGE CONTROLLER
  //============================================================

  late PageController pageController;

  //============================================================
  // CURRENT AD
  //============================================================

  final RxInt currentIndex = 0.obs;

  //============================================================
  // TIMER
  //============================================================

  Timer? _timer;

  //============================================================
  // INIT
  //============================================================

  @override
  void onInit() {
    super.onInit();

    // إنشاء PageController
    pageController = PageController(initialPage: 0);

    // تشغيل الإعلان التلقائي
    startAutoPlay();
  }

  //============================================================
  // AUTO PLAY
  //============================================================

  void startAutoPlay() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      nextAd();
    });
  }

  //============================================================
  // RESTART TIMER
  //============================================================

  void restartTimer() {
    startAutoPlay();
  }

  //============================================================
  // NEXT AD
  //============================================================

  void nextAd() {
    if (adsImages.isEmpty) {
      return;
    }

    int nextIndex;

    if (currentIndex.value >= adsImages.length - 1) {
      nextIndex = 0;
    } else {
      nextIndex = currentIndex.value + 1;
    }

    pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //============================================================
  // PREVIOUS AD
  //============================================================

  void previousAd() {
    if (adsImages.isEmpty) {
      return;
    }

    int previousIndex;

    if (currentIndex.value <= 0) {
      previousIndex = adsImages.length - 1;
    } else {
      previousIndex = currentIndex.value - 1;
    }

    pageController.animateToPage(
      previousIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //============================================================
  // GO TO SPECIFIC AD
  //============================================================

  void goToAd(int index) {
    if (index < 0 || index >= adsImages.length) {
      return;
    }

    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );

    currentIndex.value = index;

    restartTimer();
  }

  //============================================================
  // CLOSE
  //============================================================

  @override
  void onClose() {
    _timer?.cancel();

    _timer = null;

    pageController.dispose();

    super.onClose();
  }
}
