import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/data/datasource/static/static.dart';

class DotsControllerWidget extends StatelessWidget {
  const DotsControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ربط عدد النقاط بعدد عناصر صغحة الاقلاع
                      ...List.generate(
                        onBoardingList.length,
                        (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: AppColors.primerycolor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  );
  }
}