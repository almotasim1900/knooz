import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/home_page/ads_slider/ads_slider_widget.dart';
import 'package:koosh/home_page/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //======================================
    HomePageControllerImp controller = Get.put(HomePageControllerImp());

    return Scaffold(
      body: Container(
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
                            hintStyle: TextStyle(color: Color(0xFF5F6368)),
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

                  //== المسافة ========================
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

            //== نهاية الشريط العلوي
            //== المربع تحت شريط العنوان
            const AdsSliderWidget(),

            //== نهاية المربع تحت شريط العنوان
          ],
        ),
      ),
    );
  }
}
