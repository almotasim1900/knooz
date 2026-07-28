import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class RegistrationController extends GetxController {
  void registration();
  void goToLogin();
}

class RegistrationControllerImp extends RegistrationController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;

  @override
  registration() {}

  @override
  goToLogin() {
    Get.offNamed(AppsRoutesNames.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();

    password.dispose();

    super.dispose();
  }
}
