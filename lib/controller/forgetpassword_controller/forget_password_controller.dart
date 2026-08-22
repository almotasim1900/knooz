import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/forgetpassword_remote/checkemail_remote.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailRemoteData checkEmailRemoteData = CheckEmailRemoteData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? stutusRequest;

  late TextEditingController email;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      //=========================================
      stutusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailRemoteData.postdata(email.text);
      stutusRequest = handlingData(response);
      if (StatusRequest.success == stutusRequest) {
        Get.offNamed(
          AppsRoutesNames.verfiyCode,
          arguments: {"email": email.text},
        );
      } else {
        Get.defaultDialog(title: "Waring", middleText: "Email Not Found");
        stutusRequest = StatusRequest.failure;
      }
      update();
    }
    //============================================
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
