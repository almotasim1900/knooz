import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/custom_alert.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/forgetpassword_remote/checkemail_remote.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  // ================= REMOTE DATA =================

  CheckEmailRemoteData checkEmailRemoteData = CheckEmailRemoteData(Get.find());

  // ================= FORM =================

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // ================= STATUS =================

  StatusRequest? stutusRequest;

  // ================= EMAIL =================

  late TextEditingController email;

  // ================= CHECK EMAIL =================

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      // ================= LOADING =================

      stutusRequest = StatusRequest.loading;
      update();

      // ================= SEND REQUEST =================

      var response = await checkEmailRemoteData.postdata(email.text);

      // ================= HANDLE RESPONSE =================

      stutusRequest = handlingData(response);

      // ================= SUCCESS =================

      if (StatusRequest.success == stutusRequest) {
        Get.offNamed(
          AppsRoutesNames.verfiyCode,
          arguments: {"email": email.text},
        );
      }
      // ================= FAILURE =================
      else {
        stutusRequest = StatusRequest.failure;

        customAlert(
          title: 'email_not_found'.tr,
          message: 'email_not_found_message'.tr,
          icon: Icons.email_outlined,
        );
      }

      // ================= UPDATE =================

      update();
    }
  }

  // ================= ON INIT =================

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  // ================= DISPOSE =================

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
