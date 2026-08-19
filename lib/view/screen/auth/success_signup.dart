import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/success_signup_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';

// --SUCCESS SIGN UP---------------------------------------------

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTROLLER------------------------------------------------
    SuccesSignUpControllerImp controller = Get.put(SuccesSignUpControllerImp());

    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        // --APP BAR TITLE-----------------------------------------
        // backgroundColor: AppColors.white,
        centerTitle: true,
        //  sign in
        title: Text(
          'Success',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY----------------------------------------------------
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // --SUCCESS ICON---------------------------------------
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColors.primerycolor,
              ),
            ),

            //Spacer(),

            // --CONGRATULATIONS TEXT------------------------------
            Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
            ),

            // --SUCCESS MESSAGE-----------------------------------
            Text(
              "Your account has been successfully verified.\n Welcome to the family ,\n enjoy a luxurious ride ,\n and log in now  ,",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),

            // --SPACER------------------------------------------------
            Spacer(),

            // --LOGIN BUTTON--------------------------------------
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: 'Go to Login',
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),

            // --BOTTOM SPACE--------------------------------------
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
