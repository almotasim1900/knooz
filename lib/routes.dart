//ادارة التنقل بين الصفحات
import 'package:get/get.dart';
import 'package:koosh/core/constant/routes_names.dart';
import 'package:koosh/core/middleware/my_middleware.dart';
import 'package:koosh/test.dart';
import 'package:koosh/view/screen/auth/forget_password/forget_password.dart';
import 'package:koosh/view/screen/auth/forget_password/vrefiycodesignup.dart';
import 'package:koosh/view/screen/auth/login.dart';
import 'package:koosh/view/screen/auth/registration_screen.dart';
import 'package:koosh/view/screen/auth/forget_password/rest_password.dart';
import 'package:koosh/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:koosh/view/screen/auth/success_signup.dart';
import 'package:koosh/view/screen/auth/forget_password/vrefiy_code.dart';
import 'package:koosh/view/screen/language_screen.dart';
import 'package:koosh/view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  // الصفحة التي يبدأ منها التطبيق عند فتحه
  //GetPage(
  //name: "/",
  // page: () => const LanguageaScreen(),
  // middlewares: [MyMiddleware()],
  // ),
  GetPage(name: "/", page: () => Test()),

  // هذه الخطوة بعد تعريف الروت في الدالة بالرابط التالي
  // onboarding
  GetPage(name: AppsRoutesNames.onBoarding, page: () => const OnBoarding()),
  // auth
  GetPage(name: AppsRoutesNames.login, page: () => const Login()),
  GetPage(
    name: AppsRoutesNames.registrationScreen,
    page: () => const RegistrationScreen(),
  ),
  GetPage(
    name: AppsRoutesNames.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(name: AppsRoutesNames.verfiyCode, page: () => const VrefiyCode()),
  GetPage(
    name: AppsRoutesNames.reSetPassword,
    page: () => const RestPassword(),
  ),
  GetPage(
    name: AppsRoutesNames.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppsRoutesNames.successSignup,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppsRoutesNames.vrefiyCodeSignUp,
    page: () => const Vrefiycodesignup(),
  ),
];
