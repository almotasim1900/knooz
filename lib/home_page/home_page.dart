import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/home_page/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //======================================
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("home")),
      body: Container(child: Center(child: Text("${controller.id}"))),
    );
  }
}
