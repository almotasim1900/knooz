import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ads_slider_controller.dart';

class AdsSliderWidget extends GetView<AdsSliderController> {
  const AdsSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            //==================================================
            // الصور
            //==================================================
            PageView.builder(
              controller: controller.pageController,
              itemCount: controller.adsImages.length,
              onPageChanged: (index) {
                controller.currentIndex.value = index;
                controller.restartTimer();
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  controller.adsImages[index],
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                  cacheWidth: 913,
                  cacheHeight: 500,

                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 40,
                      ),
                    );
                  },
                );
              },
            ),

            //==================================================
            // Dots
            //==================================================
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.adsImages.length, (index) {
                    final bool isActive =
                        controller.currentIndex.value == index;

                    return GestureDetector(
                      onTap: () {
                        controller.goToAd(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: isActive ? 18 : 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.white : Colors.white54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
