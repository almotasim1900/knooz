import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/auth/login/login_controller.dart';
import 'package:koosh/core/class/handlingdata_view.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/Valid_input.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/auth/signup/custom_sign_in_form_field.dart';
import 'package:koosh/auth/signup/custom_text_auth.dart';
import 'package:koosh/auth/signup/custom_text_body_auth.dart';
import 'package:koosh/view/widget/auth/logo_auth.dart';
import 'package:koosh/auth/signup/registration_text_widgets.dart';
import 'package:koosh/view/widget/wavy_backround.dart';

// --LOGIN SCREEN------------------------------------------------

class Login extends StatelessWidget {
  const Login({super.key});

  // --BUILD------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // --CONTROLLER-----------------------------------------------
    Get.put(LoginControllerImp());

    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // --TITLE------------------------------------------------
        title: Text(
          'sign_in'.tr,
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

        // --BODY-------------------------------------------------
        child: Stack(
          children: [
            // --WHITE BACKGROUND---------------------------------
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.white,
            ),

            // --PURPLE WAVY BACKGROUND----------------------------
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,

              // --WAVE HEIGHT------------------------------------
              height: 60,

              child: IgnorePointer(
                child: CustomPaint(painter: WavyPurplePainter()),
              ),
            ),

            // --LOGIN CONTENT-------------------------------------
            GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingdataRequest(
                statusRequest: controller.statusRequest,

                widget: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),

                  // --FORM----------------------------------------
                  child: Form(
                    key: controller.formstate,

                    child: ListView(
                      children: [
                        // --LOGO-----------------------------------
                        const LogoAuth(),

                        const SizedBox(height: 10),

                        // --WELCOME TEXT---------------------------
                        CustomTextAuth(text: 'welcome_back'.tr),

                        const SizedBox(height: 10),

                        // --BODY TEXT------------------------------
                        CustomTextBodyAuth(text: 'login_description'.tr),

                        const SizedBox(height: 15),

                        // --EMAIL----------------------------------
                        CustomSignInFormField(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                          authController: controller.email,
                          labeltext: 'email'.tr,
                          hinttext: 'enter_email'.tr,
                          iconData: Icons.email_outlined,
                        ),

                        // --PASSWORD-------------------------------
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) {
                            return CustomSignInFormField(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 5, 20, "password");
                              },

                              authController: controller.password,

                              labeltext: 'password'.tr,

                              hinttext: 'enter_password'.tr,

                              // --PASSWORD ICON--------------------
                              iconData: controller.isShowPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,

                              obscureText: controller.isShowPassword,

                              // --SHOW / HIDE PASSWORD--------------
                              onTapIcon: () {
                                controller.showpassword();
                              },
                            );
                          },
                        ),

                        // --FORGET PASSWORD-----------------------
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },

                          child: Text(
                            'forgot_password'.tr,
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),

                        // --LOGIN BUTTON---------------------------
                        CustomButtonAuth(
                          text: 'sign_in'.tr,
                          onPressed: () {
                            controller.login();
                          },
                        ),

                        const SizedBox(height: 30),

                        // --REGISTRATION LINK----------------------
                        RegistrationTextWidget(
                          text: 'no_account'.tr,
                          text2: 'sign_up'.tr,
                          onTap: () {
                            controller.goToRegistration();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================================================
//                 WAVY PURPLE BACKGROUND
// ===============================================================
