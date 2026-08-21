// --ROUTES MANAGEMENT-------------------------------------------

//ادارة التنقل بين الصفحات
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/middleware/my_middleware.dart';
import 'package:koosh/view/screen/auth/forget_password/forget_password.dart';
import 'package:koosh/view/screen/auth/forget_password/vrefiycodesignup.dart';
import 'package:koosh/view/screen/auth/login.dart';
import 'package:koosh/view/screen/auth/registration_screen.dart';
import 'package:koosh/view/screen/auth/forget_password/rest_password.dart';
import 'package:koosh/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:koosh/view/screen/auth/success_signup.dart';
import 'package:koosh/view/screen/auth/forget_password/vrefiy_code.dart';
import 'package:koosh/view/screen/home_page.dart';
import 'package:koosh/view/screen/language_screen.dart';
import 'package:koosh/view/screen/onboarding.dart';

// --ROUTES LIST-------------------------------------------------

List<GetPage<dynamic>>? routes = [
  // --START PAGE------------------------------------------------
  GetPage(
    name: "/",
    page: () => const LanguageaScreen(),
    middlewares: [MyMiddleware()],
  ),

  // --TEST PAGE-------------------------------------------------
  //GetPage(name: "/", page: () => TestView()),

  // --ONBOARDING------------------------------------------------
  // هذه الخطوة بعد تعريف الروت في الدالة بالرابط التالي
  // onboarding
  GetPage(name: AppsRoutesNames.onBoarding, page: () => const OnBoarding()),

  // --AUTH------------------------------------------------------
  GetPage(name: AppsRoutesNames.login, page: () => const Login()),

  // --REGISTRATION----------------------------------------------
  GetPage(
    name: AppsRoutesNames.registrationScreen,
    page: () => const RegistrationScreen(),
  ),

  // --FORGET PASSWORD-------------------------------------------
  GetPage(
    name: AppsRoutesNames.forgetPassword,
    page: () => const ForgetPassword(),
  ),

  // --VERIFY CODE------------------------------------------------
  GetPage(name: AppsRoutesNames.verfiyCode, page: () => const VrefiyCode()),

  // --RESET PASSWORD--------------------------------------------
  GetPage(
    name: AppsRoutesNames.reSetPassword,
    page: () => const RestPassword(),
  ),

  // --SUCCESS RESET PASSWORD------------------------------------
  GetPage(
    name: AppsRoutesNames.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),

  // --SUCCESS SIGNUP--------------------------------------------
  GetPage(
    name: AppsRoutesNames.successSignup,
    page: () => const SuccessSignUp(),
  ),

  // --VERIFY CODE SIGNUP----------------------------------------
  GetPage(
    name: AppsRoutesNames.vrefiyCodeSignUp,
    page: () => const Vrefiycodesignup(),
  ),

  // -- HOME --------------------------------------------------
  GetPage(name: AppsRoutesNames.homePage, page: () => const HomePage()),
];
