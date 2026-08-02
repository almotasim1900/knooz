import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/reset_password_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/auth/custom_sign_in_form_field.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';

class RestPassword extends StatelessWidget {
  const RestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن متحكم جداول الادخال بالصفحة
    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.white,
        centerTitle: true,
        //  sign in
        title: Text(
          'Reset Password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            // نص Welcome Back
            CustomTextAuth(text: 'New Password'),
            const SizedBox(height: 10),
            // النص تحت Welcome Back
            CustomTextBodyAuth(text: 'Please enter new password '),
            const SizedBox(height: 15),

            // فورم رقم الباسويرد
            CustomSignInFormField(
              isNumber: true,
              valid: (val){
                return null;
              },
              authController: controller.password,
              labeltext: "Password",
              hinttext: " Enter Your password",
              iconData: Icons.lock_outlined,
            ),
            CustomSignInFormField(
              isNumber: false,
              valid: (val){
                return null;
              },
              authController: controller.repassword,
              labeltext: "Re Password",
              hinttext: " RE Enter Your password",
              iconData: Icons.lock_outlined,
            ),

            // بوتوم حفظ البايانات
            CustomButtonAuth(
              text: 'Save',
              onPressed: () {
                controller.goToSuccessResetPassword();
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
