import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/home_page/home_remote_data.dart';
import 'package:koosh/services/services.dart';
import 'package:koosh/home_page/ads_slider/ads_slider_controller.dart';

abstract class HomePageController extends GetxController {
  void initialData();
  getdata();
}

class HomePageControllerImp extends HomePageController {
  //===================================================
  // SERVICES
  //===================================================

  MyServices myServices = Get.find();

  //===================================================
  // USER DATA
  //===================================================

  String? id;
  String? username;

  //===================================================
  // REMOTE DATA
  //===================================================

  HomeRemoteData homeRemoteData = HomeRemoteData(Get.find());

  //===================================================
  // CATEGORIES
  //===================================================

  List categories = [];

  //===================================================
  // STATUS REQUEST
  //===================================================

  late StatusRequest statusRequest;

  //===================================================
  // INITIAL DATA
  //===================================================

  @override
  void initialData() {
    id = myServices.sharedPreferences.getString("id");
    username = myServices.sharedPreferences.getString("username");
  }

  //===================================================
  // INIT
  //===================================================

  @override
  void onInit() {
    initialData();

    // تسجيل Controller الخاص بالإعلانات
    Get.lazyPut<AdsSliderController>(() => AdsSliderController());

    getdata();

    super.onInit();
  }

  //===================================================
  // GET DATA
  //===================================================
  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    update();

    final response = await homeRemoteData.getData();

    print("======================== $response");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      final data = response as Map<String, dynamic>;

      if (data['status'] == "success") {
        categories.addAll(data["categories"]);
      }

      //=========================
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
