import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/auth/signup/success_signup_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';

// --SUCCESS SIGN UP---------------------------------------------

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  // --BUILD-----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTROLLER-----------------------------------------------
    SuccesSignUpControllerImp controller = Get.put(SuccesSignUpControllerImp());

    // --SCAFFOLD------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // --TITLE------------------------------------------------
        title: Text(
          'success'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY---------------------------------------------------
      body: Container(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            // --SUCCESS ICON--------------------------------------
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColors.primerycolor,
              ),
            ),

            // --CONGRATULATIONS----------------------------------
            Text(
              'congratulations'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
            ),

            // --SUCCESS MESSAGE-----------------------------------
            Text(
              'signup_success_message'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),

            // --SPACER--------------------------------------------
            const Spacer(),

            // --LOGIN BUTTON--------------------------------------
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: 'go_to_login'.tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),

            // --BOTTOM SPACE--------------------------------------
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
