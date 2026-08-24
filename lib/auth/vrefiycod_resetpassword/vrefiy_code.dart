import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:koosh/auth/vrefiycod_resetpassword/vrefiy_code_controller.dart';
import 'package:koosh/core/class/handlingdata_view.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/auth/signup/custom_text_auth.dart';
import 'package:koosh/auth/signup/custom_text_body_auth.dart';
import 'package:koosh/view/widget/wavy_backround.dart';

// --VERIFICATION CODE SCREEN-----------------------------------

class VrefiyCode extends StatelessWidget {
  const VrefiyCode({super.key});

  // --BUILD-----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // --CONTROLLER-----------------------------------------------

    VrefiyCodeControllerImp controller = Get.put(VrefiyCodeControllerImp());

    // --SCAFFOLD------------------------------------------------

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // --TITLE------------------------------------------------
        title: Text(
          'verification_code'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY---------------------------------------------------
      body: PopScope(
        canPop: false,

        // --BACK BUTTON------------------------------------------
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }

          alertExitApp();
        },

        // --PAGE CONTENT-----------------------------------------
        child: Stack(
          children: [
            // --MAIN CONTENT-------------------------------------
            GetBuilder<VrefiyCodeControllerImp>(
              builder: (controller) => HandlingdataRequest(
                // --STATUS REQUEST--------------------------------
                statusRequest: controller.statusRequest,

                // --WIDGET---------------------------------------
                widget: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),

                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 70),

                    children: [
                      // ================= TITLE =================
                      CustomTextAuth(text: 'check_code'.tr),

                      const SizedBox(height: 10),

                      // ================= EMAIL =================
                      CustomTextBodyAuth(
                        text: 'code_sent_to'.trParams({
                          'email': controller.email ?? '',
                        }),
                      ),

                      const SizedBox(height: 15),

                      // ================= OTP =================
                      OtpTextField(
                        fieldWidth: 50,
                        numberOfFields: 4,

                        borderRadius: BorderRadius.circular(20),

                        borderColor: AppColors.primerycolor,

                        showFieldAsBox: true,

                        onCodeChanged: (String code) {},

                        onSubmit: (String verificationCode) async {
                          await controller.checkCode(verificationCode);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // --PURPLE WAVY BACKGROUND--------------------------
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 60,

              child: IgnorePointer(
                child: CustomPaint(painter: WavyPurplePainter()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
