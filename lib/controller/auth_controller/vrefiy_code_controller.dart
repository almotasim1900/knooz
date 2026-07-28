import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class VrefiyCodeController extends GetxController {
  void checkCode();
  void goToResetPassword();
}

class VrefiyCodeControllerImp extends VrefiyCodeController {
  late String vrefiyCode;

  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppsRoutesNames.reSetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
