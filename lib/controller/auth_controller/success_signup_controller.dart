import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';

abstract class SuccesSignUpController extends GetxController {
  void goToPageLogin();
}

class SuccesSignUpControllerImp extends SuccesSignUpController {
  @override
  goToPageLogin() {
    Get.offNamed(AppsRoutesNames.login);
  }
}
