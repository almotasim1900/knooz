import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/registration_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/Valid_input.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/auth/custom_sign_in_form_field.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';
import 'package:koosh/view/widget/auth/registration_text_widgets.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن متحكم جداول الادخال بالصفحة

    Get.lazyPut(() => RegistrationControllerImp());
    // هذه صيغة بديلة من اجل حقن المتحكم في الصفحة بدون انشاء نسخة جديدة منه)(صيغة بديلة)
    //RegistrationControllerImp controller = Get.put(RegistrationControllerImp());

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.white,
        centerTitle: true,
        //  sign in
        title: Text(
          'Registration',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          alertExitApp(); // استدعاء دالة الخروج هنا عند محاولة الرجوع
        },
        child: GetBuilder<RegistrationControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  // نص Welcome Back
                  CustomTextAuth(text: 'Welcome Back'),
                  const SizedBox(height: 10),
                  // النص تحت Welcome Back
                  CustomTextBodyAuth(
                    text:
                        'Sign up With Your Email And Phone And Password Or Continue With Social Media ',
                  ),
                  const SizedBox(height: 15),
                  // فور لادخال اليوزر نيم
                  CustomSignInFormField(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 14, "username");
                    },
                    authController: controller.username,
                    labeltext: "Username",
                    hinttext: " Enter Username",
                    iconData: Icons.person_2_outlined,
                    //mycontroller: ,
                  ),

                  // فورم ادخال الايميل
                  CustomSignInFormField(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "email");
                    },
                    authController: controller.email,
                    labeltext: "Email",
                    hinttext: " Enter Your Email",
                    iconData: Icons.email_outlined,
                    //mycontroller: ,
                  ),

                  // فورم رقم الهاتف
                  CustomSignInFormField(
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 10, 10, "phone");
                    },
                    authController: controller.phone,
                    labeltext: "Phone",
                    hinttext: " Enter Your Phone",
                    iconData: Icons.phone_android_outlined,
                    //mycontroller: ,
                  ),

                  //فورم ادخال الرقم السري
                  CustomSignInFormField(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 6, 14, "password");
                    },
                    authController: controller.password,
                    labeltext: "Password",
                    hinttext: " Enter Your Password",
                    iconData: Icons.lock_outlined,
                    //mycontroller: ,
                  ),
                  //
                  // نهاية فورم ادخال الرقم السري
                  // بوتوم تسجيل الدخول
                  CustomButtonAuth(
                    text: 'Registar',
                    onPressed: () {
                      controller.registration();
                    },
                  ),
                  SizedBox(height: 30),
                  // بداية سطر اذا ما عندك حساب
                  RegistrationTextWidget(
                    text: "have an account?  ",
                    text2: 'Sign In',
                    onTap: () {
                      controller.goToLogin();
                    },
                  ),

                  // نهاية سطر اذا ما عندك حساب
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
