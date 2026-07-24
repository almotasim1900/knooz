import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';
import 'package:koosh/view/widget/auth/custom_button_auth.dart';
import 'package:koosh/view/widget/auth/custom_sign_in_form_field.dart';
import 'package:koosh/view/widget/auth/custom_text_auth.dart';
import 'package:koosh/view/widget/auth/custom_text_body_auth.dart';
import 'package:koosh/view/widget/auth/logo_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
            const CustomSignInFormField(
              labeltext: "Email",
              hinttext: " Enter Your Email",
              iconData: Icons.email_outlined,
              //mycontroller: ,
            ),

            // نهاية فورم ادخال الايميل
            //فورم ادخال الرقم السري
            //F:\flutter\koosh\lib\view\widget\auth\custom_sign_in_form_field.dart
            const CustomSignInFormField(
              labeltext: "Password",
              hinttext: " Enter Your Password",
              iconData: Icons.lock_outlined,
              //mycontroller: ,
            ),
            //
            // نهاية فورم ادخال الرقم السري
            Text(
              'Forger Password',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // بوتوم تسجيل الدخول
            CustomButtonAuth(text: 'Sing In', onPressed: () {}),
            SizedBox(height: 30),
            // بداية سطر اذا ما عندك حساب
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?  ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                InkWell(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primerycolor,
                    ),
                  ),
                ),
              ],
            ),
            // نهاية سطر اذا ما عندك حساب
          ],
        ),
      ),
    );
  }
}
