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

  // عدد المحاولات
  int attempts = 3;

  // ================= CHECK CODE =================

  @override
  Future<void> checkCode(String verificationCode) async {
    // إذا انتهت المحاولات
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

    // ================= CHECK RESPONSE =================

    if (StatusRequest.success == statusRequest) {
      // ================= CODE CORRECT =================

      if ((response as Map)['status'] == "success") {
        // الانتقال إلى صفحة النجاح
        Get.offAllNamed(AppsRoutesNames.successSignup);
      } else {
        // ================= CODE WRONG =================

        attempts--;

        statusRequest = StatusRequest.failure;

        // ما زالت هناك محاولات
        if (attempts > 0) {
          Get.defaultDialog(
            title: "Wrong Code",
            middleText:
                "The verification code is incorrect.\n\n"
                "Attempts remaining: $attempts",
          );
        } else {
          // ================= NO ATTEMPTS =================

          Get.defaultDialog(
            title: "No Attempts Left",
            middleText:
                "You have used all 3 attempts.\n\n"
                "Please register again.",
            textConfirm: "OK",
            onConfirm: () {
              Get.offAllNamed(AppsRoutesNames.registrationScreen);
            },
          );
        }
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
