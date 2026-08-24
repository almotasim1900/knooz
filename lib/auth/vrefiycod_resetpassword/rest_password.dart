import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/auth/vrefiycod_resetpassword/reset_password_controller.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/app_assets.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/auth/signup/custom_sign_in_form_field.dart';
import 'package:koosh/auth/signup/custom_text_auth.dart';
import 'package:koosh/auth/signup/custom_text_body_auth.dart';
import 'package:koosh/view/widget/wavy_backround.dart';
import 'package:lottie/lottie.dart';

// --RESET PASSWORD SCREEN--------------------------------------

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  // --BUILD-----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // --CONTROLLER-----------------------------------------------

    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );

    // --SCAFFOLD------------------------------------------------

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // --TITLE------------------------------------------------
        title: Text(
          'reset_password'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY---------------------------------------------------
      body: PopScope(
        canPop: false,

        // --BACK BUTTON-------------------------------------------
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }

          alertExitApp();
        },

        // --GET BUILDER-------------------------------------------
        child: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => Stack(
            children: [
              // --MAIN CONTENT------------------------------------
              controller.statusRequest == StatusRequest.loading
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
                            CustomTextAuth(text: 'new_password'.tr),

                            const SizedBox(height: 10),

                            // --DESCRIPTION----------------------
                            CustomTextBodyAuth(text: 'enter_new_password'.tr),

                            const SizedBox(height: 15),

                            // --PASSWORD--------------------------
                            CustomSignInFormField(
                              isNumber: false,

                              valid: (val) {
                                return null;
                              },

                              authController: controller.password,

                              labeltext: 'password'.tr,

                              hinttext: 'enter_your_password'.tr,

                              iconData: Icons.lock_outlined,

                              // --SHOW / HIDE PASSWORD-----------
                              obscureText: !controller.showPassword,

                              onTapIcon: () {
                                controller.showPassword =
                                    !controller.showPassword;

                                controller.update();
                              },
                            ),

                            // --RE PASSWORD-----------------------
                            CustomSignInFormField(
                              isNumber: false,

                              valid: (val) {
                                return null;
                              },

                              authController: controller.repassword,

                              labeltext: 're_password'.tr,

                              hinttext: 're_enter_your_password'.tr,

                              iconData: Icons.lock_outlined,

                              // --SHOW / HIDE RE PASSWORD--------
                              obscureText: !controller.showRePassword,

                              onTapIcon: () {
                                controller.showRePassword =
                                    !controller.showRePassword;

                                controller.update();
                              },
                            ),

                            // --SAVE BUTTON------------------------
                            CustomButtonAuth(
                              text: 'save'.tr,

                              onPressed: () {
                                controller.goToSuccessResetPassword();
                              },
                            ),

                            const SizedBox(height: 30),
                          ],
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
      ),
    );
  }
}
