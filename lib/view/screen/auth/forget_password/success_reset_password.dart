import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/success_reset_password_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        SuccesResetPasswordControllerImp controller = Get.put(SuccesResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColors.primerycolor,
              ),
            ),

            //Spacer(),
            Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
            ),
            Text(
              "Your account has been successfully verified.\n Welcome to the family ,\n enjoy a luxurious ride ,\n and log in now  ,",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: 'Go to Login',
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

  
