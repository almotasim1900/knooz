import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class AuthController extends GetxController {
  void login();
  void goToRegistration();
  void goToForgetPassword();
}

class LoginControllerImp extends AuthController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {}

  @override
  goToRegistration() {
    Get.offNamed(AppsRoutesNames.registrationScreen);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  void goToForgetPassword() {
        Get.offNamed(AppsRoutesNames.forgetPassword);

  }
}
