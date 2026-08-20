import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/auth_remote/vrefiycodesignup_remote.dart';

abstract class VrefiyCodeSignUpController extends GetxController {
  Future<void> checkCode(String verificationCode);
}

class VrefiyCodeSignUpControllerImp extends VrefiyCodeSignUpController {
  // ================= REMOTE DATA =================

  VrefiycodesignupRemoteData vrefiycodesignupRemoteData =
      VrefiycodesignupRemoteData(Get.find());

  // ================= VARIABLES =================

  String? email;

  StatusRequest? statusRequest;

  // ================= CHECK CODE =================

  @override
  Future<void> checkCode(String verificationCode) async {
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

    // ================= CHECK RESPONSE =================

    if (StatusRequest.success == statusRequest) {
      if ((response as Map)['status'] == "success") {
        // ================= SUCCESS =================

        Get.offAllNamed(AppsRoutesNames.successSignup);
      } else {
        // ================= WRONG CODE =================

        statusRequest = StatusRequest.failure;

        Get.defaultDialog(
          title: "Warning",
          middleText: "Verification code is incorrect",
        );
      }
    }

    // ================= UPDATE UI =================

    update();
  }

  // ================= ON INIT =================

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
