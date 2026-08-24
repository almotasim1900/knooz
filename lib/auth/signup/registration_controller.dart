import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/auth/signup/signup_remote.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/custom_alert.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';

// --REGISTRATION CONTROLLER-------------------------------------

abstract class RegistrationController extends GetxController {
  // --REGISTRATION----------------------------------------------
  void registration();

  // --GO TO LOGIN-----------------------------------------------
  void goToLogin();
}

// --REGISTRATION CONTROLLER IMP---------------------------------

class RegistrationControllerImp extends RegistrationController {
  // --FORM STATE------------------------------------------------

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // --TEXT CONTROLLERS------------------------------------------

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool showPassword = false;

  // --STATUS REQUEST--------------------------------------------

  StatusRequest statusRequest = StatusRequest.none;

  // --SIGN UP REMOTE DATA---------------------------------------

  SignUpRemoteData signUpRemoteData = SignUpRemoteData(Get.find());

  // --REGISTRATION----------------------------------------------

  @override
  registration() async {
    // --GET FORM------------------------------------------------

    var formData = formstate.currentState;

    // --VALIDATE FORM-------------------------------------------

    if (formData!.validate()) {
      // --LOADING-----------------------------------------------

      statusRequest = StatusRequest.loading;
      update();

      // --SEND REQUEST------------------------------------------

      var response = await signUpRemoteData.postdata(
        username.text,
        password.text,
        email.text,
        phone.text,
      );

      // --HANDLE RESPONSE---------------------------------------

      statusRequest = handlingData(response);

      // ========================================================
      //                  SUCCESS RESPONSE
      // ========================================================

      if (statusRequest == StatusRequest.success) {
        if (response is Map) {
          // --SERVER SUCCESS------------------------------------

          if (response['status'] == "success") {
            // --GO TO VERIFY CODE-------------------------------

            Get.offNamed(
              AppsRoutesNames.vrefiyCodeSignUp,
              arguments: {"email": email.text},
            );
          }
          // --EMAIL OR PHONE ALREADY EXISTS--------------------
          else {
            statusRequest = StatusRequest.failure;

            customAlert(
              title: 'warning',
              message: 'email_phone_exist',
              icon: Icons.warning_amber_rounded,
            );
          }
        }
      }
      // ========================================================
      //                    FAILURE
      // ========================================================
      else if (statusRequest == StatusRequest.failure) {
        customAlert(
          title: 'warning',
          message: 'email_phone_exist',
          icon: Icons.warning_amber_rounded,
        );
      }
      // ========================================================
      //                  SERVER FAILURE
      // ========================================================
      else if (statusRequest == StatusRequest.serverfailure) {
        customAlert(
          title: 'server_error',
          message: 'server_problem',
          icon: Icons.cloud_off_rounded,
        );
      }
      // ========================================================
      //                 SERVER EXCEPTION
      // ========================================================
      else if (statusRequest == StatusRequest.serverException) {
        customAlert(
          title: 'server_error',
          message: 'server_exception',
          icon: Icons.error_outline_rounded,
        );
      }
      // ========================================================
      //                 OFFLINE FAILURE
      // ========================================================
      else if (statusRequest == StatusRequest.oflinefailure) {
        customAlert(
          title: 'connection_error',
          message: 'check_internet',
          icon: Icons.wifi_off_rounded,
        );
      }

      // --UPDATE UI---------------------------------------------

      update();
    }
  }

  // --GO TO LOGIN-----------------------------------------------

  @override
  goToLogin() {
    Get.offNamed(AppsRoutesNames.login);
  }

  // --ON INIT---------------------------------------------------

  @override
  void onInit() {
    // --USERNAME CONTROLLER-------------------------------------

    username = TextEditingController();

    // --EMAIL CONTROLLER----------------------------------------

    email = TextEditingController();

    // --PHONE CONTROLLER----------------------------------------

    phone = TextEditingController();

    // --PASSWORD CONTROLLER-------------------------------------

    password = TextEditingController();

    super.onInit();
  }

  // --DISPOSE---------------------------------------------------

  @override
  void dispose() {
    // --DISPOSE USERNAME-----------------------------------------

    username.dispose();

    // --DISPOSE EMAIL--------------------------------------------

    email.dispose();

    // --DISPOSE PHONE--------------------------------------------

    phone.dispose();

    // --DISPOSE PASSWORD-----------------------------------------

    password.dispose();

    super.dispose();
  }
}
