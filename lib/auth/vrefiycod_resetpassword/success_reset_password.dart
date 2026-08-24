import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:koosh/auth/vrefiycod_resetpassword/success_reset_password_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/wavy_backround.dart';

// --SUCCESS RESET PASSWORD-------------------------------------

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  // --BUILD----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTROLLER----------------------------------------------
    SuccesResetPasswordControllerImp controller = Get.put(
      SuccesResetPasswordControllerImp(),
    );

    // --SCAFFOLD-----------------------------------------------
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // --TITLE-----------------------------------------------
        title: Text(
          'success'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY-------------------------------------------------
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),

            child: Column(
              children: [
                // --SUCCESS ICON-------------------------------
                Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: AppColors.primerycolor,
                  ),
                ),

                // --SUCCESS TITLE------------------------------
                Text(
                  'password_reset_success'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
                ),

                const SizedBox(height: 15),

                // --SUCCESS MESSAGE----------------------------
                Text(
                  'password_reset_success_message'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
                ),

                const Spacer(),

                // --LOGIN BUTTON-------------------------------
                SizedBox(
                  width: double.infinity,

                  child: CustomButtonAuth(
                    text: 'go_to_login'.tr,

                    onPressed: () {
                      controller.goToPageLogin();
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),

          // --PURPLE WAVY BACKGROUND----------------------------
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
    );
  }
}
