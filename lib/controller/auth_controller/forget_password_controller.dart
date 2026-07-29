import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkemail();
  void goVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  @override
  checkemail() {}

  @override
  goVerfiyCode() {
    Get.offNamed(AppsRoutesNames.verfiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();


    super.dispose();
  }
}
