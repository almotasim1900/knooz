import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:koosh/app_link_api.dart';
import 'package:koosh/core/class/handlingdata_view.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/home_page/ads_slider/ads_slider_widget.dart';
import 'package:koosh/home_page/announcementbar.dart';
import 'package:koosh/home_page/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      //==========================================================
      // تغيير لون شريط الحالة
      //==========================================================
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primerycolor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),

      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,

        body: GetBuilder<HomePageControllerImp>(
          builder: (controller) {
            return HandlingdataView(
              statusRequest: controller.statusRequest,

              widget: Container(
                color: AppColors.backgroundColor,

                child: ListView(
                  children: [
                    //==========================================================
                    // الشريط العلوي
                    //==========================================================
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          //====================================================
                          // شريط البحث
                          //====================================================
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),

                              child: Container(
                                height: 48,

                                // البنفسجي الفاتح بدل الأسود الشفاف
                                color: AppColors.wavePurpleLight,

                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,

                                  decoration: const InputDecoration(
                                    border: InputBorder.none,

                                    hintText: 'What are you looking for?',

                                    hintStyle: TextStyle(color: AppColors.gray),

                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 26,

                                      // البنفسجي الملكي
                                      color: AppColors.royalPurpleLight,
                                    ),

                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          //====================================================
                          // مربع الإشعارات
                          //====================================================
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Container(
                              width: 55,
                              height: 48,

                              alignment: Alignment.center,

                              // نفس لون البحث
                              color: AppColors.wavePurpleLight,

                              child: IconButton(
                                padding: EdgeInsets.zero,

                                onPressed: () {},

                                icon: const Icon(
                                  Icons.notifications_active_outlined,

                                  size: 30,

                                  // البنفسجي الملكي
                                  color: AppColors.royalPurpleLight,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //==========================================================
                    // المساحة الإعلانية
                    //==========================================================
                    const AdsSliderWidget(),

                    //==========================================================
                    // الأقسام
                    //==========================================================
                    SizedBox(
                      height: 120,

                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,

                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },

                        itemCount: controller.categories.length,

                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              //================================================
                              // صورة القسم
                              //================================================
                              Container(
                                height: 70,
                                width: 70,

                                decoration: BoxDecoration(
                                  color: AppColors.white,

                                  borderRadius: BorderRadius.circular(10),

                                  // ظل خفيف
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.royalPurple.withValues(
                                        alpha: 0.08,
                                      ),

                                      blurRadius: 5,

                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),

                                  child: Image.network(
                                    "${AppLink.categoriesServerImages}/${controller.categories[index]['categories_image']}",

                                    width: 70,
                                    height: 70,

                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 5),

                              //================================================
                              // اسم القسم
                              //================================================
                              SizedBox(
                                width: 70,

                                child: Text(
                                  Get.locale?.languageCode == 'ar'
                                      ? controller
                                            .categories[index]['categories_name_ar']
                                      : controller
                                            .categories[index]['categories_name'],

                                  textAlign: TextAlign.center,

                                  maxLines: 2,

                                  overflow: TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    color: AppColors.gray,

                                    fontSize: 12,

                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    //==========================================================
                    // عنوان منتجات قد تعجبك
                    //==========================================================
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 10,
                      ),

                      child: const Text(
                        "Products You May Like",

                        style: TextStyle(
                          // البنفسجي الأساسي بدل الأسود
                          color: AppColors.royalPurple,

                          fontSize: 20,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //==========================================================
                    // منتجات قد تعجبك
                    //==========================================================
                    Container(
                      height: 180,

                      // خلفية التطبيق
                      color: AppColors.backgroundColor,

                      padding: const EdgeInsets.symmetric(vertical: 10),

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemCount: 10,

                        itemBuilder: (context, index) {
                          return Container(
                            width: 160,
                            height: 160,

                            //================================================
                            // المسافة بين الصور = 10
                            //================================================
                            margin: const EdgeInsets.only(left: 10),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child: Stack(
                                fit: StackFit.expand,

                                children: [
                                  //============================================
                                  // صورة المنتج
                                  //============================================
                                  Image.asset(
                                    "assets/images/onboardingfour.webp",

                                    width: 160,
                                    height: 160,

                                    fit: BoxFit.cover,
                                  ),

                                  //============================================
                                  // الظلال فوق الصورة
                                  //============================================
                                  Container(
                                    decoration: BoxDecoration(
                                      // بنفسجي ملكي شفاف
                                      color: AppColors.royalPurple.withValues(
                                        alpha: 0.30,
                                      ),

                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child: Text(
                                      "Samsungn\nNote10 PRO",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //==========================================================
                    // الشريط المتحرك
                    //==========================================================
                    const AnnouncementBar(),

                    //==========================================================
                    // نهاية الصفحة
                    //==========================================================
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
