
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class CheckEmailController extends GetxController {
  void checkemail();
  void goToSuccessSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  checkemail() {} 

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppsRoutesNames.successSignup);
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
