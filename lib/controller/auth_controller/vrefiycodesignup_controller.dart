import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class VrefiyCodeSignUpController extends GetxController {
  void checkCode();
  void goToSuccessSignUp();
}

class VrefiyCodeSignUpControllerImp extends VrefiyCodeSignUpController {
  late String vrefiyCode;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppsRoutesNames.successSignup);
  }

}
