import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/auth_remote/login_remote.dart';

// --LOGIN CONTROLLER---------------------------------------------
abstract class AuthController extends GetxController {
  // --LOGIN------------------------------------------------------
  void login();
  // --GO TO REGISTRATION----------------------------------------
  void goToRegistration();
  // --GO TO FORGET PASSWORD-------------------------------------
  void goToForgetPassword();
}

// --LOGIN CONTROLLER IMP-----------------------------------------
class LoginControllerImp extends AuthController {
  // --FORM STATE------------------------------------------------
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  // --TEXT CONTROLLERS------------------------------------------
  late TextEditingController email;
  late TextEditingController password;
  // --PASSWORD--------------------------------------------------
  bool isShowPassword = true;
  void showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  // --STATUS REQUEST--------------------------------------------
  StatusRequest? statusRequest;
  // --LOGIN REMOTE DATA-----------------------------------------
  LoginRemoteData loginRemoteData = LoginRemoteData(Get.find());
  // --LOGIN-----------------------------------------------------
  @override
  login() async {
    // --GET FORM------------------------------------------------
    var formData = formstate.currentState;
    // --VALIDATE FORM-------------------------------------------
    if (formData!.validate()) {
      // --GET DATA----------------------------------------------
      Future<void> getData() async {
        // --LOADING---------------------------------------------
        statusRequest = StatusRequest.loading;
        update();
        // --SEND REQUEST----------------------------------------
        var response = await loginRemoteData.login(email.text, password.text);
        // --HANDLE RESPONSE-------------------------------------
        statusRequest = handlingData(response);
        // --CHECK SUCCESS---------------------------------------
        if (StatusRequest.success == statusRequest) {
          // --CHECK SERVER STATUS-------------------------------
          if ((response as Map)['status'] == "success") {
            // --LOGIN SUCCESS-----------------------------------
            // هنا نضع الانتقال للصفحة التالية
            // بعد أن نتأكد من شكل استجابة login.php
            Get.offNamed(AppsRoutesNames.homePage);
          } else {
            // --FAILURE-----------------------------------------
            Get.defaultDialog(
              title: "Warning",
              middleText: "The email or password is incorrect.",
            );
            statusRequest = StatusRequest.failure;
          }
        }
        // --UPDATE UI-------------------------------------------
        update();
      }

      // --CALL GET DATA-----------------------------------------
      await getData();
    } else {
      // --FORM NOT VALID----------------------------------------
      'Not Valid';
    }
  }

  // --GO TO REGISTRATION----------------------------------------
  @override
  goToRegistration() {
    Get.offNamed(AppsRoutesNames.registrationScreen);
  }

  // --GO TO FORGET PASSWORD-------------------------------------
  @override
  goToForgetPassword() {
    Get.offNamed(AppsRoutesNames.forgetPassword);
  }

  // --ON INIT---------------------------------------------------
  @override
  void onInit() {
    // --EMAIL CONTROLLER----------------------------------------
    email = TextEditingController();
    // --PASSWORD CONTROLLER-------------------------------------
    password = TextEditingController();
    // --SUPER ON INIT-------------------------------------------
    super.onInit();
  }

  // --DISPOSE---------------------------------------------------
  @override
  void dispose() {
    // --DISPOSE EMAIL-------------------------------------------
    email.dispose();
    // --DISPOSE PASSWORD----------------------------------------
    password.dispose();
    // --SUPER DISPOSE-------------------------------------------
    super.dispose();
  }
}
