import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/login_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/Valid_input.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/auth/custom_sign_in_form_field.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';
import 'package:koosh/view/widget/auth/logo_auth.dart';
import 'package:koosh/view/widget/auth/registration_text_widgets.dart';

// --LOGIN SCREEN------------------------------------------------

class Login extends StatelessWidget {
  const Login({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTROLLER------------------------------------------------
    //حقن متحكم جداول الادخال بالص
    LoginControllerImp controller = Get.put(LoginControllerImp());

    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        // --APP BAR------------------------------------------------
        // backgroundColor: AppColors.white,
        centerTitle: true,

        // --TITLE--------------------------------------------------
        //  sign in
        title: Text(
          'Sign In',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY----------------------------------------------------
      body: PopScope(
        canPop: false,

        // --BACK BUTTON--------------------------------------------
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          alertExitApp(); // استدعاء دالة الخروج هنا عند محاولة الرجوع
        },

        // --CONTAINER----------------------------------------------
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),

          // --FORM-------------------------------------------------
          // نضعها داخل فورم للحصول علي key
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                // --LOGO------------------------------------------------
                // اضافة صورة اللوقو
                LogoAuth(),

                // --WELCOME TEXT---------------------------------------
                // نص Welcome Back
                CustomTextAuth(text: 'Welcome Back'),
                const SizedBox(height: 10),

                // --BODY TEXT------------------------------------------
                // النص تحت Welcome Back
                CustomTextBodyAuth(
                  text:
                      'Sign in With Your Email And Password Or Continue With Social Media ',
                ),

                // --EMAIL FORM-----------------------------------------
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

                // --END EMAIL FORM------------------------------------
                // نهاية فورم ادخال الايميل

                // --PASSWORD FORM-------------------------------------
                //فورم ادخال الرقم السري
                //F:\flutter\koosh\lib\view\widget\auth\custom_sign_in_form_field.dart
                GetBuilder<LoginControllerImp>(
                  builder: (controller) {
                    return CustomSignInFormField(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 20, "password");
                      },
                      authController: controller.password,
                      labeltext: "Password",
                      hinttext: " Enter Your Password",
                      iconData: Icons.lock_outlined,
                      obscureText: controller.isShowPassword,

                      // --SHOW PASSWORD--------------------------------
                      onTapIcon: () {
                        controller.showpassword();
                      },
                    );
                  },
                ),

                // --END PASSWORD FORM---------------------------------
                // نهاية فورم ادخال الرقم السري

                // --FORGET PASSWORD----------------------------------
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

                // --LOGIN BUTTON--------------------------------------
                // بوتوم تسجيل الدخول
                CustomButtonAuth(
                  text: 'Sing In',
                  onPressed: () {
                    controller.login();
                  },
                ),

                // --SPACE------------------------------------------------
                SizedBox(height: 30),

                // --REGISTRATION LINK--------------------------------
                // بداية سطر اذا ما عندك حساب
                RegistrationTextWidget(
                  text: "Don't have an account?  ",
                  text2: 'Sign Up',
                  onTap: () {
                    controller.goToRegistration();
                  },
                ),

                // --END REGISTRATION LINK-----------------------------
                // نهاية سطر اذا ما عندك حسا
              ],
            ),
          ),
        ),
      ),
    );
  }
}
