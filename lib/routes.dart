// --ROUTES MANAGEMENT-------------------------------------------

//ادارة التنقل بين الصفحات
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/middleware/my_middleware.dart';
import 'package:koosh/auth/forgetpassword/forget_password.dart';
import 'package:koosh/auth/vrefiy_code_signup/vrefiycodesignup.dart';
import 'package:koosh/auth/login/login.dart';
import 'package:koosh/auth/signup/registration_screen.dart';
import 'package:koosh/auth/vrefiycod_resetpassword/rest_password.dart';
import 'package:koosh/auth/vrefiycod_resetpassword/success_reset_password.dart';
import 'package:koosh/auth/signup/success_signup.dart';
import 'package:koosh/auth/vrefiycod_resetpassword/vrefiy_code.dart';
import 'package:koosh/home_page/home_page.dart';
import 'package:koosh/view/screen/language_screen.dart';
import 'package:koosh/onboarding/onboarding_screen.dart';

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
