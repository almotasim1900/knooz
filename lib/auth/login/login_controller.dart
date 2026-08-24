import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/custom_alert.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/auth/login/login_remote.dart';
import 'package:koosh/services/services.dart';

// --LOGIN CONTROLLER---------------------------------------------

abstract class AuthController extends GetxController {
  // --LOGIN------------------------------------------------------
  void login();

  // --GO TO REGISTRATION-----------------------------------------
  void goToRegistration();

  // --GO TO FORGET PASSWORD--------------------------------------
  void goToForgetPassword();
}

// --LOGIN CONTROLLER IMP------------------------------------------

class LoginControllerImp extends AuthController {
  // --FORM STATE-------------------------------------------------
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // --TEXT CONTROLLERS-------------------------------------------
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();

  // --PASSWORD---------------------------------------------------
  bool isShowPassword = true;

  void showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  // --STATUS REQUEST---------------------------------------------
  StatusRequest statusRequest = StatusRequest.none;

  // --LOGIN REMOTE DATA------------------------------------------
  LoginRemoteData loginRemoteData = LoginRemoteData(Get.find());

  // --LOGIN------------------------------------------------------

  @override
  login() async {
    // --GET FORM-----------------------------------------------
    var formData = formstate.currentState;

    // --VALIDATE FORM------------------------------------------
    if (formData!.validate()) {
      // --LOADING----------------------------------------------
      statusRequest = StatusRequest.loading;
      update();

      // --SEND REQUEST-----------------------------------------
      var response = await loginRemoteData.login(email.text, password.text);
      print("LOGIN RESPONSE: $response");

      // --HANDLE RESPONSE--------------------------------------
      statusRequest = handlingData(response);

      // --SUCCESS----------------------------------------------
      if (statusRequest == StatusRequest.success) {
        if (response is Map && response['status'] == "success") {
          //===تخزين العملية بالشيردفرنسس ==============================
          myServices.sharedPreferences.setString(
            "id",
            response['data']['user_id'].toString(),
          );
          myServices.sharedPreferences.setString(
            "username",
            response['data']['user_name'],
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['user_email'],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']['user_phone'],
          );
          myServices.sharedPreferences.setString("step", "2");

          // --LOGIN SUCCESS------------------------------------
          Get.offNamed(AppsRoutesNames.homePage);
        } else {
          // --EMAIL OR PASSWORD WRONG--------------------------
          statusRequest = StatusRequest.failure;

          customAlert(
            title: 'warning',
            message: 'invalid_login',
            icon: Icons.warning_amber_rounded,
          );
        }
      }
      // --FAILURE---------------------------------------------
      else if (statusRequest == StatusRequest.failure) {
        customAlert(
          title: 'warning',
          message: 'invalid_login',
          icon: Icons.warning_amber_rounded,
        );
      }
      // --SERVER FAILURE--------------------------------------
      else if (statusRequest == StatusRequest.serverfailure) {
        customAlert(
          title: 'server_error',
          message: 'server_problem',
          icon: Icons.cloud_off_rounded,
        );
      }
      // --SERVER EXCEPTION------------------------------------
      else if (statusRequest == StatusRequest.serverException) {
        customAlert(
          title: 'server_error',
          message: 'server_exception',
          icon: Icons.error_outline_rounded,
        );
      }
      // --OFFLINE FAILURE-------------------------------------
      else if (statusRequest == StatusRequest.oflinefailure) {
        customAlert(
          title: 'connection_error',
          message: 'check_internet',
          icon: Icons.wifi_off_rounded,
        );
      }

      // --UPDATE UI--------------------------------------------
      update();
    }
  }

  // --GO TO REGISTRATION-----------------------------------------

  @override
  goToRegistration() {
    Get.offNamed(AppsRoutesNames.registrationScreen);
  }

  // --GO TO FORGET PASSWORD--------------------------------------

  @override
  goToForgetPassword() {
    Get.offNamed(AppsRoutesNames.forgetPassword);
  }

  // --ON INIT----------------------------------------------------

  @override
  void onInit() {
    //===اضافة الفايربيز ======================================
    //FirebaseMessaging.instance.getToken().then((value) {
    // print("TOKEN_START:${value}:TOKEN_END");
    // String? token = value;
    //});
    //==========================================================
    // --EMAIL CONTROLLER---------------------------------------
    email = TextEditingController();

    // --PASSWORD CONTROLLER------------------------------------
    password = TextEditingController();

    super.onInit();
  }

  // --DISPOSE----------------------------------------------------

  @override
  void dispose() {
    // --DISPOSE EMAIL------------------------------------------
    email.dispose();

    // --DISPOSE PASSWORD---------------------------------------
    password.dispose();

    super.dispose();
  }
}
