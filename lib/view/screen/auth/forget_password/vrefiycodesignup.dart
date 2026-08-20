import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:koosh/controller/auth_controller/vrefiycodesignup_controller.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/app_assets.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';
import 'package:lottie/lottie.dart';

class Vrefiycodesignup extends StatelessWidget {
  const Vrefiycodesignup({super.key});

  @override
  Widget build(BuildContext context) {
    VrefiyCodeSignUpControllerImp controller = Get.put(
      VrefiyCodeSignUpControllerImp(),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verification Code',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      body: GetBuilder<VrefiyCodeSignUpControllerImp>(
        builder: (controller) {
          // ================= LOADING =================

          if (controller.statusRequest == StatusRequest.loading) {
            return Center(child: Lottie.asset(AppAssets.loading));
          }

          // ================= PAGE =================

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),

            child: ListView(
              children: [
                // ================= TITLE =================
                CustomTextAuth(text: 'Check Code'),

                const SizedBox(height: 10),

                // ================= EMAIL =================
                CustomTextBodyAuth(
                  text:
                      'Please Enter the Digit Code Sent To ${controller.email}',
                ),

                const SizedBox(height: 15),

                // ================= OTP =================
                OtpTextField(
                  fieldWidth: 50,

                  numberOfFields: 4,

                  borderRadius: BorderRadius.circular(20),

                  borderColor: const Color(0xFF512DA8),

                  showFieldAsBox: true,

                  onCodeChanged: (String code) {},

                  onSubmit: (String verificationCode) async {
                    await controller.checkCode(verificationCode);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
