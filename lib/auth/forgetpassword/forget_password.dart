import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/auth/forgetpassword/forget_password_controller.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/app_assets.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/auth/signup/custom_sign_in_form_field.dart';
import 'package:koosh/auth/signup/custom_text_auth.dart';
import 'package:koosh/auth/signup/custom_text_body_auth.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/wavy_backround.dart';
import 'package:lottie/lottie.dart';

// --FORGET PASSWORD SCREEN--------------------------------------

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  // --BUILD-----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTROLLER-----------------------------------------------
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );

    // --SCAFFOLD------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // --TITLE------------------------------------------------
        title: Text(
          'check_email'.tr,
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

        // --GET BUILDER------------------------------------------
        child: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => Stack(
            children: [
              // --MAIN CONTENT-----------------------------------
              controller.stutusRequest == StatusRequest.loading
                  ? Center(child: Lottie.asset(AppAssets.loading))
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),

                      // --FORM------------------------------------
                      child: Form(
                        key: controller.formstate,

                        child: ListView(
                          padding: const EdgeInsets.only(bottom: 70),

                          children: [
                            // --TITLE TEXT-----------------------
                            CustomTextAuth(text: 'check_email'.tr),

                            const SizedBox(height: 10),

                            // --DESCRIPTION----------------------
                            CustomTextBodyAuth(
                              text: 'forget_password_description'.tr,
                            ),

                            const SizedBox(height: 15),

                            // --EMAIL-----------------------------
                            CustomSignInFormField(
                              isNumber: false,

                              valid: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'empty_field'.tr;
                                }

                                return null;
                              },

                              authController: controller.email,

                              labeltext: 'email'.tr,

                              hinttext: 'enter_email'.tr,

                              iconData: Icons.email_outlined,
                            ),

                            const SizedBox(height: 10),

                            // --CHECK BUTTON----------------------
                            CustomButtonAuth(
                              text: 'check'.tr,

                              onPressed: () {
                                controller.checkemail();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

              // --PURPLE WAVY BACKGROUND-------------------------
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
      ),
    );
  }
}
