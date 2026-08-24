import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppsRoutesNames.homePage);
    }
    //===========================================================
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppsRoutesNames.login);
    }
    return null;
  }
}
