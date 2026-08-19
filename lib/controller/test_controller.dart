import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/functions/handligdata_controller.dart';
import 'package:koosh/data/datasource/remote/test_data.dart';

// TEST CONTROLLER
class TestController extends GetxController {
  // TEST DATA
  TestData testData = TestData(Get.find());
  // DATA LIST
  List data = [];
  // STATUS REQUEST
  late StatusRequest statusRequest;
  // GET DATA
  Future<void> getData() async {
    // LOADING
    statusRequest = StatusRequest.loading;
    // SEND REQUEST
    var response = await testData.getData();
    // HANDLE RESPONSE
    statusRequest = handlingData(response);
    // CHECK SUCCESS
    if (StatusRequest.success == statusRequest) {
      if ((response as Map)['status'] == "success") {
        // ADD DATA TO LIST
        data.addAll(List.from((response)["data"]));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // UPDATE UI
    update();
  }

  // ON INIT
  @override
  void onInit() {
    // GET DATA
    getData();
    // SUPER ON INIT
    super.onInit();
  }
}
