import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/auth_remote/signup_remote.dart';

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

  // --STATUS REQUEST--------------------------------------------

  late StatusRequest statusRequest;

  // --SIGN UP REMOTE DATA---------------------------------------

  SignUpRemoteData signUpRemoteData = SignUpRemoteData(Get.find());

  // --REGISTRATION----------------------------------------------

  @override
  registration() async {
    // --GET FORM------------------------------------------------

    var formData = formstate.currentState;

    // --VALIDATE FORM-------------------------------------------

    if (formData!.validate()) {
      // --GET DATA-----------------------------------------------

      Future<void> getData() async {
        // --LOADING----------------------------------------------

        statusRequest = StatusRequest.loading;

        // --SEND REQUEST-----------------------------------------

        var response = await signUpRemoteData.postdata(
          username.text,
          password.text,
          email.text,
          phone.text,
        );

        // --HANDLE RESPONSE--------------------------------------

        statusRequest = handlingData(response);

        // --CHECK SUCCESS----------------------------------------

        if (StatusRequest.success == statusRequest) {
          // --CHECK SERVER STATUS--------------------------------

          if ((response as Map)['status'] == "success") {
            // --GO TO VERIFY CODE--------------------------------

            Get.offNamed(AppsRoutesNames.vrefiyCodeSignUp);
          } else {
            // --FAILURE------------------------------------------

            Get.defaultDialog(
              title: "Warning",
              middleText: "The email or phone number already exists.",
            );

            statusRequest = StatusRequest.failure;
          }
        }

        // --UPDATE UI--------------------------------------------

        update();
      }

      // --CALL GET DATA------------------------------------------

      await getData();
    } else {
      // --FORM NOT VALID-----------------------------------------

      'Not Valid';
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

    // --PASSWORD CONTROLLER--------------------------------------

    password = TextEditingController();

    // --SUPER ON INIT--------------------------------------------

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

    // --SUPER DISPOSE--------------------------------------------

    super.dispose();
  }
}
