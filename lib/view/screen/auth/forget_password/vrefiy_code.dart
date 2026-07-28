import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:koosh/controller/auth_controller/vrefiy_code_controller.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';

class VrefiyCode extends StatelessWidget {
  const VrefiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    // حقن متحكم جداول الادخال بالصفحة
    VrefiyCodeControllerImp controller = Get.put(VrefiyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.white,
        centerTitle: true,
        //  sign in
        title: Text(
          'Verification Code',
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
            CustomTextAuth(text: 'Check Code '),
            const SizedBox(height: 10),
            // النص تحت Welcome Back
            CustomTextBodyAuth(
              text: 'Please Enter the Digit Code Send To motasim@gmail.com',
            ),
            const SizedBox(height: 15),

            // فورم رقم الهاتف
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 4,
              borderRadius: BorderRadius.circular(20),
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                // الي اي ايصفحة يجب ان ننتقل بعد كنابة الرمز
                controller.goToResetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}
