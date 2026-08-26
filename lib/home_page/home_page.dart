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

    return
    //== تغير لون شريط الحالة ===============================
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.primerycolor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: GetBuilder<HomePageControllerImp>(
          builder: (controller) => HandlingdataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  //== الشريط العلوي ===================
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //== شريط البحث =====================
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 48,
                              color: AppColors.wavePurpleLight,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'What are you looking for?',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF5F6368),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 26,
                                    color: Color(0xFF5F6368),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        //== مربع الإشعارات =================
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 55,
                            height: 48,
                            alignment: Alignment.center,
                            color: AppColors.wavePurpleLight,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active_outlined,
                                size: 30,
                                color: Color(0xFF5F6368),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //=== المساحة الاعلانية=============================
                  const AdsSliderWidget(),
                  //== الاقسام===========================
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: controller.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        //===============================
                        return Column(
                          //==========
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 70,
                              width: 70,

                              child: Image.network(
                                "${AppLink.categoriesServerImages}/${controller.categories[index]['categories_image']}",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            //============
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
                  //========قسم منتجات لك  ==================
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Products You May Like",
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.wavePurpleLight,
                    height: 200,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/images/onboardingfour.webp",
                                  height: 200,
                                  width: 150,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  //== الشريط المتحرك ======
                  AnnouncementBar(),
                  //==================
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
