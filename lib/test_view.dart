import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/handlingdata_view.dart';
import 'package:koosh/core/constant/colors.dart';
import 'controller/test_controller.dart';

// --TEST VIEW----------------------------------------------------

class TestView extends StatelessWidget {
  const TestView({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --PUT TEST CONTROLLER--------------------------------------
    Get.put(TestController());

    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      // --APP BAR-------------------------------------------------
      appBar: AppBar(
        title: const Text("صفحة تجريبية"),
        backgroundColor: AppColors.primerycolor,
      ),

      // --BODY----------------------------------------------------
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingdataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              // --NUMBER OF ITEMS---------------------------------
              itemCount: controller.data.length,

              // --BUILD ITEM--------------------------------------
              itemBuilder: (context, index) {
                // --CURRENT ITEM----------------------------------
                return Text("${controller.data[index]}");
              },
            ),
          );
        },
      ),
    );
  }
}
