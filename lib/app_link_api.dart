class AppLink {
  //-- الرابط الرئيسي للسيرفر-------------------------
  static const String server = "https://kush-crown.com/kushapp";
  //--test------------------------
  static const String test = "$server/test.php";
  //==auth============================================
  static const String login = "$server/auth/login.php";
  static const String signUp = "$server/auth/signup.php";
  static const String verfiyCodeSignUp = "$server/auth/verfiycode.php";
  //==FORGET PASSWORD ============================================
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verfiyCodeForNewPass =
      "$server/forgetpassword/verfiycodefor_new_pass.php";
  // ==== homepage ==============================================
  static const String homePage = "$server/home.php";
}
