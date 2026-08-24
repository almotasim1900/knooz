import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ===========================================================
// MY SERVICES
// ===========================================================

class MyServices extends GetxService {
  // =========================================================
  // SHARED PREFERENCES
  // =========================================================

  late SharedPreferences sharedPreferences;

  // =========================================================
  // INITIALIZE SERVICES
  // =========================================================

  Future<MyServices> init() async {
    // =======================================================
    // SHARED PREFERENCES
    // =======================================================

    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }
}

// ===========================================================
// INITIAL SERVICES
// ===========================================================

Future<void> initialServices() async {
  await Get.putAsync<MyServices>(() => MyServices().init());
}
