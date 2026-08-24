import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class SuccesResetPasswordController extends GetxController {
  void goToPageLogin();
}

class SuccesResetPasswordControllerImp extends SuccesResetPasswordController {
  @override
  void goToPageLogin() {
    Get.offNamed(AppsRoutesNames.login);
  }
}
