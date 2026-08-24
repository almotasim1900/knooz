import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/colors.dart';

void customAlert({
  required String title,
  required String message,
  IconData icon = Icons.warning_amber_rounded,
  void Function()? onPressed,
}) {
  Get.defaultDialog(
    title: "",
    titlePadding: EdgeInsets.zero,
    contentPadding: const EdgeInsets.fromLTRB(25, 10, 25, 25),

    backgroundColor: Colors.white,
    radius: 25,

    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // -- ICON -----------------------------------------
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.primerycolor.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 38, color: AppColors.primerycolor),
        ),

        const SizedBox(height: 15),

        // -- TITLE ----------------------------------------
        Text(
          title.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primerycolor,
          ),
        ),

        const SizedBox(height: 10),

        // -- MESSAGE --------------------------------------
        Text(
          message.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: AppColors.gray),
        ),

        const SizedBox(height: 20),

        // -- BUTTON ---------------------------------------
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed:
                onPressed ??
                () {
                  Get.back();
                },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primerycolor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'ok'.tr,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
