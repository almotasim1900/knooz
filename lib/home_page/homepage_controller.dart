import 'package:get/get.dart';
import 'package:koosh/services/services.dart';

class HomePageController extends GetxController {}

class HomePageControllerImp extends HomePageController {
  //===================================================
  MyServices myServices = Get.find();
  String? id;
  String? username;

  //========================================
  initialData() {
    id = myServices.sharedPreferences.getString("id");
    username = myServices.sharedPreferences.getString("username");
  }
  //===================================

  //=======================================
  @override
  void onInit() {
    initialData();
    super.onInit();
    //===============================
  }
}
