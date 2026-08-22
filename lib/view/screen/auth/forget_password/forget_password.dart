import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/forgetpassword_controller/forget_password_controller.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/app_assets.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/auth/custom_sign_in_form_field.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن متحكم جداول الادخال بالصفحة
    ForgetPasswordControllerImp controller = Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.white,
        centerTitle: true,
        //  sign in
        title: Text(
          'Forget Password',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) =>
            controller.stutusRequest == StatusRequest.loading
            ? Center(child: Lottie.asset(AppAssets.loading))
            : Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      // نص Welcome Back
                      CustomTextAuth(text: 'Check Email'),
                      const SizedBox(height: 10),
                      // النص تحت Welcome Back
                      CustomTextBodyAuth(
                        text:
                            'Please Enter Your Email Address To Recive A Verification Code ',
                      ),
                      const SizedBox(height: 15),

                      // فورم رقم الهاتف
                      CustomSignInFormField(
                        isNumber: false,
                        valid: (val) {
                          if (val == null || val.isEmpty) {
                            return "Please enter your email";
                          }

                          return null;
                        },
                        authController: controller.email,
                        labeltext: "Email",
                        hinttext: " Enter Your Email",
                        iconData: Icons.email_outlined,
                      ),

                      // بوتوم تسجيل الدخول
                      CustomButtonAuth(
                        text: 'Check',
                        onPressed: () {
                          controller.checkemail();
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
