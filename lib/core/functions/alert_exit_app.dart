import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/core/constant/colors.dart';

void alertExitApp() {
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
          child: const Icon(
            Icons.exit_to_app_rounded,
            size: 38,
            color: AppColors.primerycolor,
          ),
        ),

        const SizedBox(height: 15),

        // -- TITLE ----------------------------------------
        Text(
          'exit_app'.tr,
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
          'exit_app_message'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: AppColors.gray),
        ),

        const SizedBox(height: 20),

        // -- BUTTONS --------------------------------------
        Row(
          children: [
            // -- CANCEL BUTTON ----------------------------
            Expanded(
              child: SizedBox(
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.gray,
                    side: BorderSide(
                      color: AppColors.gray.withValues(alpha: 0.4),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'cancel'.tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // -- CONFIRM BUTTON ---------------------------
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    exit(0);
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
                    'confirm'.tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
