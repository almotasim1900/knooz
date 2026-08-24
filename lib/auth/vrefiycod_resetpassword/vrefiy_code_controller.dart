import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/auth/vrefiycod_resetpassword/verfiycodefor_new_pass_remote.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/custom_alert.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';

// --VERIFY CODE CONTROLLER--------------------------------------

abstract class VrefiyCodeController extends GetxController {
  Future<void> checkCode(String verificationCode);
}

// --CONTROLLER IMPLEMENTATION-----------------------------------

class VrefiyCodeControllerImp extends VrefiyCodeController {
  // ================= REMOTE DATA =================

  VerfiyCodeForgetPasswordRemoteData verfiyCodeForgetPasswordRemoteData =
      VerfiyCodeForgetPasswordRemoteData(Get.find());

  // ================= VARIABLES =================

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  // ================= ATTEMPTS =================

  int attempts = 3;

  // ================= CHECK CODE =================

  @override
  Future<void> checkCode(String verificationCode) async {
    // ================= CHECK ATTEMPTS =================

    if (attempts <= 0) {
      return;
    }

    // ================= LOADING =================

    statusRequest = StatusRequest.loading;
    update();

    // ================= SEND REQUEST =================

    var response = await verfiyCodeForgetPasswordRemoteData.postdata(
      email!,
      verificationCode,
    );

    // ================= HANDLE RESPONSE =================

    statusRequest = handlingData(response);

    // ================= SUCCESS =================

    if (statusRequest == StatusRequest.success) {
      // ================= CODE CORRECT =================

      if ((response as Map)['status'] == "success") {
        Get.offNamed(
          AppsRoutesNames.reSetPassword,
          arguments: {"email": email},
        );
      }
      // ================= CODE WRONG =================
      else {
        attempts--;

        statusRequest = StatusRequest.failure;

        update();

        if (attempts > 0) {
          customAlert(
            title: 'wrong_code'.tr,
            message: 'wrong_code_message'.trParams({
              'attempts': attempts.toString(),
            }),
            icon: Icons.warning_amber_rounded,
          );
        } else {
          customAlert(
            title: 'no_attempts_left'.tr,
            message: 'no_attempts_message'.tr,
            icon: Icons.error_outline,
            onPressed: () {
              Get.offAllNamed(AppsRoutesNames.login);
            },
          );
        }
      }
    }
    // ================= FAILURE =================
    else if (statusRequest == StatusRequest.failure) {
      // ================= WRONG CODE =================

      attempts--;

      update();

      if (attempts > 0) {
        customAlert(
          title: 'wrong_code'.tr,
          message: 'wrong_code_message'.trParams({
            'attempts': attempts.toString(),
          }),
          icon: Icons.warning_amber_rounded,
        );
      } else {
        customAlert(
          title: 'no_attempts_left'.tr,
          message: 'no_attempts_message'.tr,
          icon: Icons.error_outline,
          onPressed: () {
            Get.offAllNamed(AppsRoutesNames.login);
          },
        );
      }
    }

    // ================= UPDATE =================

    update();
  }

  // ================= ON INIT =================

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
