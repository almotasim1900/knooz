import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/core/class/status_request.dart';
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
      appBar: AppBar(title: const Text("صفحة تجريبية")),

      // --BODY----------------------------------------------------
      body: GetBuilder<TestController>(
        builder: (controller) {
          // --LOADING---------------------------------------------
          if (controller.statusRequest == StatusRequest.loading) {
            return const Center(child: Text("Loading..."));

            // --OFFLINE FAILURE-------------------------------------
          } else if (controller.statusRequest == StatusRequest.oflinefailure) {
            return const Center(child: Text("Offline Failure"));

            // --SERVER FAILURE--------------------------------------
          } else if (controller.statusRequest == StatusRequest.serverfailure) {
            return const Center(child: Text("Server Failure"));

            // --SUCCESS---------------------------------------------
          } else {
            // --LIST VIEW-----------------------------------------
            return ListView.builder(
              // --NUMBER OF ITEMS---------------------------------
              itemCount: controller.data.length,

              // --BUILD ITEM--------------------------------------
              itemBuilder: (context, index) {
                // --CURRENT ITEM----------------------------------
                return Text("${controller.data[index]}");
              },
            );
          }
        },
      ),
    );
  }
}
