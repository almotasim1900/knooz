import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/auth/vrefiycod_resetpassword/resetpassword_remote.dart';

import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/custom_alert.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';

abstract class ResetPasswordController extends GetxController {
  void resetpassword();

  void goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  //===========================================================
  // FORM
  //===========================================================

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //===========================================================
  // REMOTE DATA
  //===========================================================

  ResetPasswordRemoteData resetPasswordRemoteData = ResetPasswordRemoteData(
    Get.find(),
  );

  //===========================================================
  // STATUS
  //===========================================================

  StatusRequest? statusRequest;

  //===========================================================
  // TEXT CONTROLLERS
  //===========================================================

  late TextEditingController password;
  late TextEditingController repassword;

  //===========================================================
  // EMAIL
  //===========================================================

  String? email;

  //===========================================================
  // PASSWORD VISIBILITY
  //===========================================================

  bool showPassword = false;

  bool showRePassword = false;

  //===========================================================
  // RESET PASSWORD
  //===========================================================

  @override
  resetpassword() {}

  //===========================================================
  // SAVE NEW PASSWORD
  //===========================================================

  @override
  goToSuccessResetPassword() async {
    //=========================================================
    // CHECK PASSWORD MATCH
    //=========================================================

    if (password.text != repassword.text) {
      customAlert(
        title: 'password_not_match'.tr,
        message: 'password_not_match_message'.tr,
        icon: Icons.lock_outline,
      );

      return;
    }

    //=========================================================
    // VALIDATE FORM
    //=========================================================

    if (formstate.currentState!.validate()) {
      //=======================================================
      // LOADING
      //=======================================================

      statusRequest = StatusRequest.loading;
      update();

      //=======================================================
      // SEND REQUEST
      //=======================================================

      var response = await resetPasswordRemoteData.postdata(
        email!,
        password.text,
      );

      //=======================================================
      // HANDLE RESPONSE
      //=======================================================

      statusRequest = handlingData(response);

      //=======================================================
      // SUCCESS
      //=======================================================

      if (StatusRequest.success == statusRequest &&
          response is Map &&
          response['status'] == "success") {
        Get.offNamed(AppsRoutesNames.successResetPassword);
      }
      //=======================================================
      // ERROR
      //=======================================================
      else {
        statusRequest = StatusRequest.failure;

        customAlert(
          title: 'warning'.tr,
          message: 'try_again'.tr,
          icon: Icons.warning_amber_rounded,
        );
      }

      update();
    }
  }

  //===========================================================
  // ON INIT
  //===========================================================

  @override
  void onInit() {
    email = Get.arguments["email"];

    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  //===========================================================
  // DISPOSE
  //===========================================================

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
