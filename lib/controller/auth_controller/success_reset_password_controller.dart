import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class SuccesResetPasswordController extends GetxController {
  void goToPageLogin();
}

class SuccesResetPasswordControllerImp extends SuccesResetPasswordController {
  @override
  goToPageLogin() {
    Get.offNamed(AppsRoutesNames.login);
  }
}
