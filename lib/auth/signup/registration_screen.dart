import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koosh/auth/signup/registration_controller.dart';
import 'package:koosh/core/class/handlingdata_view.dart';
import 'package:koosh/core/class/status_request.dart';
import 'package:koosh/core/constant/app_assets.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/core/functions/Valid_input.dart';
import 'package:koosh/core/functions/alert_exit_app.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/auth/signup/custom_sign_in_form_field.dart';
import 'package:koosh/auth/signup/custom_text_auth.dart';
import 'package:koosh/auth/signup/custom_text_body_auth.dart';
import 'package:koosh/auth/signup/registration_text_widgets.dart';
import 'package:lottie/lottie.dart';

// --REGISTRATION SCREEN-----------------------------------------

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTROLLER------------------------------------------------
    // حقن متحكم جداول الادخال بالصفحة
    Get.lazyPut(() => RegistrationControllerImp());

    // --SCAFFOLD-------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        // --APP BAR-----------------------------------------------
        centerTitle: true,

        // --TITLE------------------------------------------------
        title: Text(
          'registration'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.gray),
        ),
      ),

      // --BODY----------------------------------------------------
      body: PopScope(
        canPop: false,

        // --BACK BUTTON-------------------------------------------
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }

          alertExitApp();
        },

        // --GET BUILDER-------------------------------------------
        child: GetBuilder<RegistrationControllerImp>(
          builder: (controller) => HandlingdataRequest(
            statusRequest: controller.statusRequest,

            widget: controller.statusRequest == StatusRequest.loading
                ? Center(child: Lottie.asset(AppAssets.loading))
                : Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),

                    // --FORM-----------------------------------------
                    child: Form(
                      key: controller.formstate,

                      child: ListView(
                        children: [
                          // --WELCOME TEXT----------------------------
                          CustomTextAuth(text: 'welcome_family'.tr),

                          const SizedBox(height: 10),

                          // --BODY TEXT-------------------------------
                          CustomTextBodyAuth(
                            text: 'registration_description'.tr,
                          ),

                          const SizedBox(height: 15),

                          // --USERNAME FORM FIELD---------------------
                          CustomSignInFormField(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 3, 14, "username");
                            },

                            authController: controller.username,

                            labeltext: 'username'.tr,

                            hinttext: 'enter_username'.tr,

                            iconData: Icons.person_2_outlined,
                          ),

                          // --EMAIL FORM FIELD------------------------
                          CustomSignInFormField(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 5, 30, "email");
                            },

                            authController: controller.email,

                            labeltext: 'email'.tr,

                            hinttext: 'enter_email'.tr,

                            iconData: Icons.email_outlined,
                          ),

                          // --PHONE FORM FIELD------------------------
                          CustomSignInFormField(
                            isNumber: true,

                            valid: (val) {
                              return validInput(val!, 10, 10, "phone");
                            },

                            authController: controller.phone,

                            labeltext: 'phone'.tr,

                            hinttext: 'enter_phone'.tr,

                            iconData: Icons.phone_android_outlined,
                          ),

                          // --PASSWORD FORM FIELD---------------------
                          CustomSignInFormField(
                            isNumber: false,

                            valid: (val) {
                              return validInput(val!, 6, 14, "password");
                            },

                            authController: controller.password,

                            labeltext: 'password'.tr,

                            hinttext: 'enter_password'.tr,

                            iconData: Icons.lock_outlined,

                            // إخفاء كلمة المرور
                            obscureText: !controller.showPassword,

                            // إظهار وإخفاء كلمة المرور
                            onTapIcon: () {
                              controller.showPassword =
                                  !controller.showPassword;

                              controller.update();
                            },
                          ),

                          // --REGISTRATION BUTTON---------------------
                          CustomButtonAuth(
                            text: 'register'.tr,

                            onPressed: () {
                              controller.registration();
                            },
                          ),

                          const SizedBox(height: 30),

                          // --SIGN IN LINK----------------------------
                          RegistrationTextWidget(
                            text: 'have_account'.tr,

                            text2: 'sign_in'.tr,

                            onTap: () {
                              controller.goToLogin();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
