import 'package:get/get.dart';
import 'package:koosh/core/class/crud_request.dart';

class Intialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CrudRequest());
  }
}
