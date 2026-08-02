import 'dart:io'; // 1. استيراد مكتبة النظام لحل مشكلة exit(0)
import 'package:get/get.dart';
import 'package:koosh/core/constant/colors.dart';

void alertExitApp() {
  Get.defaultDialog(
    title: 'Alert',
    middleText: 'Do you want to exit the app?', 
    textConfirm: 'Confirm',
    textCancel: 'Cancel',
    confirmTextColor: AppColors.white,
    onConfirm: () {
      exit(0); // إنهاء التطبيق بنجاح
    },
    onCancel: () {
      Get.back(); // إغلاق الحوار
    },
    buttonColor:AppColors.red, // لون مميز لزر التأكيد
  );
}