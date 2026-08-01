import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/login_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/Valid_input.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/auth/custom_sign_in_form_field.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';
import 'package:koosh/view/widget/auth/logo_auth.dart';
import 'package:koosh/view/widget/auth/registration_text_widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    //حقن متحكم جداول الادخال بالص
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.white,
        centerTitle: true,
        //  sign in
        title: Text(
          'Sign In',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        // نضعها داخل فورم للحصول علي key
        child: Form(
          key:controller.formstate ,
          child: ListView(
            children: [
              // اضافة صورة اللوقو
              LogoAuth(),
              // نص Welcome Back
              CustomTextAuth(text: 'Welcome Back'),
              const SizedBox(height: 10),
              // النص تحت Welcome Back
              CustomTextBodyAuth(
                text:
                    'Sign in With Your Email And Password Or Continue With Social Media ',
              ),
              // فورم ادخال الايميل
              const SizedBox(height: 15),
              //F:\flutter\koosh\lib\view\widget\auth\custom_sign_in_form_field.dart
              CustomSignInFormField(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                authController: controller.email,
                labeltext: "Email",
                hinttext: " Enter Your Email",
                iconData: Icons.email_outlined,
                //mycontroller:
              ),
          
              // نهاية فورم ادخال الايميل
              //فورم ادخال الرقم السري
              //F:\flutter\koosh\lib\view\widget\auth\custom_sign_in_form_field.dart
              CustomSignInFormField(
                isNumber:false ,
                valid: (val) {
                  return validInput(val!, 5, 20, "password");
                },
                authController: controller.password,
                labeltext: "Password",
                hinttext: " Enter Your Password",
                iconData: Icons.lock_outlined,
                //mycontroller: ,
              ),
              //
              // نهاية فورم ادخال الرقم السري
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: Text(
                  'Forger Password',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          
              // بوتوم تسجيل الدخول
              CustomButtonAuth(
                text: 'Sing In',
                onPressed: () {
                  controller.login();
                },
              ),
              SizedBox(height: 30),
              // بداية سطر اذا ما عندك حساب
              RegistrationTextWidget(
                text: "Don't have an account?  ",
                text2: 'Sign Up',
                onTap: () {
                  controller.goToRegistration();
                },
              ),
              // نهاية سطر اذا ما عندك حسا
            ],
          ),
        ),
      ),
    );
  }
}
