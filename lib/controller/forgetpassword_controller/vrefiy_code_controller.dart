import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/forgetpassword_remote/verfiycodefor_new_pass_remote.dart';

abstract class VrefiyCodeController extends GetxController {
  void checkCode();
  void goToResetPassword(String verfiycode);
}

class VrefiyCodeControllerImp extends VrefiyCodeController {
  //=========================
  String? email;

  VerfiyCodeForgetPasswordRemoteData verfiyCodeForgetPasswordRemoteData =
      VerfiyCodeForgetPasswordRemoteData(Get.find());

  StatusRequest? statusRequest;

  //===============================

  @override
  checkCode() {}

  @override
  goToResetPassword(verfiycode) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verfiyCodeForgetPasswordRemoteData.postdata(
      email!,
      verfiycode,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest &&
        response is Map &&
        response['status'] == "success") {
      Get.offNamed(AppsRoutesNames.reSetPassword);
    } else {
      statusRequest = StatusRequest.failure;

      Get.defaultDialog(title: "Waring", middleText: "Verfiy Code Not correct");
    }

    // مهم جدًا: خارج الـ if
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
