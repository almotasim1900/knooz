import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/custom_alert.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/auth/vrefiy_code_signup/vrefiycodesignup_remote.dart';

abstract class VrefiyCodeSignUpController extends GetxController {
  Future<void> checkCode(String verificationCode);
}

class VrefiyCodeSignUpControllerImp extends VrefiyCodeSignUpController {
  // ================= REMOTE DATA =================

  VrefiycodesignupRemoteData vrefiycodesignupRemoteData =
      VrefiycodesignupRemoteData(Get.find());

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

    var response = await vrefiycodesignupRemoteData.postData(
      email!,
      verificationCode,
    );

    // ================= HANDLE RESPONSE =================

    statusRequest = handlingData(response);

    // ================= SUCCESS =================

    if (statusRequest == StatusRequest.success) {
      // ================= CODE CORRECT =================

      if ((response as Map)['status'] == "success") {
        Get.offAllNamed(AppsRoutesNames.successSignup);
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

            // ================= GO TO LOGIN =================
            onPressed: () {
              Get.offAllNamed(AppsRoutesNames.login);
            },
          );
        }
      }
    }
    // ================= FAILURE =================
    else if (statusRequest == StatusRequest.failure) {
      // السيرفر رجع failure
      // الرمز غير صحيح

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

          // ================= GO TO LOGIN =================
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
