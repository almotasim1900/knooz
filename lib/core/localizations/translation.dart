import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    //===========================================================
    //===========================================================
    // ARABIC
    //===========================================================
    //===========================================================
    'ar': {
      //== Forget Password =====================================
      'forgot_password': 'نسيت كلمة المرور؟',
      'check_email': 'تحقق من البريد الإلكتروني',
      'forget_password_description': 'أدخل بريدك الإلكتروني لاستلام رمز التحقق',
      'check': 'تحقق',
      'email_not_found': 'البريد الإلكتروني غير موجود',
      'email_not_found_message':
          'لم يتم العثور على هذا البريد الإلكتروني. يرجى التأكد من البريد الإلكتروني والمحاولة مرة أخرى.',

      //== Custom Alert ========================================
      'warning': 'تحذير',
      'invalid_login': 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
      'server_error': 'خطأ في الخادم',
      'server_problem': 'توجد مشكلة في الخادم.',
      'server_exception': 'حدث خطأ في الخادم، يرجى المحاولة مرة أخرى.',
      'connection_error': 'خطأ في الاتصال',
      'check_internet': 'يرجى التحقق من اتصالك بالإنترنت.',
      'ok': 'موافق',

      //== Alert Exit App ======================================
      'exit_app': 'الخروج من التطبيق',
      'exit_app_message': 'هل تريد الخروج من التطبيق؟',
      'confirm': 'تأكيد',
      'cancel': 'إلغاء',

      //== Valid Input =========================================
      'empty_field': 'لا يمكن أن يكون الحقل فارغًا',
      'invalid_username': 'اسم المستخدم غير صالح',
      'invalid_email': 'البريد الإلكتروني غير صالح',
      'invalid_phone': 'رقم الهاتف غير صالح',
      'too_short': 'لا يمكن أن يكون أقل من @min حرف',
      'too_long': 'لا يمكن أن يكون أكثر من @max حرف',

      //== Login ===============================================
      'sign_in': 'تسجيل الدخول',
      'welcome_back': 'مرحباً بعودتك',
      'login_description':
          'قم بتسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور أو تابع باستخدام وسائل التواصل الاجتماعي',
      'email': 'البريد الإلكتروني',
      'enter_email': 'أدخل بريدك الإلكتروني',
      'password': 'كلمة المرور',
      'enter_password': 'أدخل كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'no_account': 'ليس لديك حساب؟  ',
      'sign_up': 'إنشاء حساب',

      //== Registration ========================================
      'registration': 'إنشاء حساب',
      'welcome_family': 'مرحباً بك في العائلة',
      'registration_description':
          'أنشئ حسابك باستخدام اسم المستخدم والبريد الإلكتروني ورقم الهاتف وكلمة المرور',
      'username': 'اسم المستخدم',
      'enter_username': 'أدخل اسم المستخدم',
      'phone': 'رقم الهاتف',
      'enter_phone': 'أدخل رقم هاتفك',
      'register': 'إنشاء الحساب',
      'have_account': 'لديك حساب بالفعل؟  ',

      //== Registration Alert ==================================
      'email_phone_exist': 'البريد الإلكتروني أو رقم الهاتف موجود مسبقًا',

      //== Verification Code - Sign Up ========================
      'verification_code': 'رمز التحقق',
      'check_code': 'تحقق من الرمز',
      'code_sent_to': 'يرجى إدخال رمز التحقق المرسل إلى @email',

      'wrong_code': 'رمز التحقق غير صحيح',
      'wrong_code_message':
          'رمز التحقق الذي أدخلته غير صحيح. لديك @attempts محاولات متبقية.',

      'no_attempts_left': 'انتهت المحاولات',
      'no_attempts_message':
          'لقد استنفدت جميع محاولات التحقق. سيتم تحويلك إلى صفحة تسجيل الدخول.',

      //== Verification Code - Reset Password =================
      'verification_code_wrong': 'رمز التحقق غير صحيح',

      'verification_code_wrong_message':
          'رمز التحقق الذي أدخلته غير صحيح. يرجى التحقق من الرمز والمحاولة مرة أخرى.',

      'verification_code_attempts_message':
          'رمز التحقق الذي أدخلته غير صحيح. لديك @attempts محاولات متبقية.',

      //== Reset Password ======================================
      'reset_password': 'إعادة تعيين كلمة المرور',
      'new_password': 'كلمة المرور الجديدة',
      'enter_new_password': 'أدخل كلمة المرور الجديدة',
      'enter_your_password': 'أدخل كلمة المرور الجديدة',
      're_password': 'إعادة كتابة كلمة المرور',
      're_enter_your_password': 'أعد كتابة كلمة المرور',
      'save': 'حفظ',

      'password_not_match': 'كلمة المرور غير متطابقة',
      'password_not_match_message':
          'كلمتا المرور غير متطابقتين. يرجى التأكد من إدخالهما بشكل صحيح.',

      'try_again': 'حدث خطأ. يرجى المحاولة مرة أخرى.',

      //== Success =============================================
      'success': 'تم بنجاح',

      'password_reset_success': 'تم تغيير كلمة المرور بنجاح',

      'password_reset_success_message':
          'تم تغيير كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.',

      'go_to_login': 'الانتقال إلى تسجيل الدخول',

      //== Success Sign Up =====================================
      'congratulations': 'تهانينا',

      'signup_success_message': 'تم إنشاء الحساب بنجاح',

      'account_verified_successfully':
          'تم التحقق من حسابك بنجاح.\nمرحباً بك في العائلة،\nنتمنى لك تجربة فاخرة،\nيمكنك الآن تسجيل الدخول.',

      //== Language ============================================
      'arabic': 'العربية',
      'english': 'الإنجليزية',
      'choose_language': 'اختر اللغة',

      //== Onboarding ==========================================
      'onboardingTitle1': 'انتقِ منتجك',

      'onboarding_Body_1':
          'انتقِ منتجك من بين آلاف المنتجات \nبكل ثقة من متجرنا \nالإلكتروني المتكامل.',

      'onboardingTitle2': 'دفع سهل وآمن',

      'onboarding_Body_2':
          'طرق دفع سهلة وآمنة. \nموثوقة من قِبل عملائنا \nمن جميع أنحاء السودان.',

      'onboardingTitle3': 'تتبّع طلبك',

      'onboarding_Body_3':
          'تتبّع طلبك لحظة بلحظة \nحتى يصل إليك بأمان \nأينما كنت.',

      'onboardingTitle4': 'توصيل سريع',

      'onboarding_Body_4':
          'توصيل سريع وموثوق. نحن \nنوصل منتجك بأسرع \nطريقة ممكنة.',

      'continue': 'إستمرار',
    },

    //===========================================================
    //===========================================================
    // ENGLISH
    //===========================================================
    //===========================================================
    'en': {
      //== Forget Password =====================================
      'forgot_password': 'Forgot Password?',
      'check_email': 'Check Email',
      'forget_password_description':
          'Please enter your email address to receive a verification code',
      'check': 'Check',
      'email_not_found': 'Email Not Found',
      'email_not_found_message':
          'This email address was not found. Please check your email and try again.',

      //== Custom Alert ========================================
      'warning': 'Warning',
      'invalid_login': 'The email or password is incorrect.',
      'server_error': 'Server Error',
      'server_problem': 'There is a problem with the server.',
      'server_exception': 'A server error occurred. Please try again.',
      'connection_error': 'Connection Error',
      'check_internet': 'Please check your internet connection.',
      'ok': 'OK',

      //== Alert Exit App ======================================
      'exit_app': 'Exit App',
      'exit_app_message': 'Do you want to exit the app?',
      'confirm': 'Confirm',
      'cancel': 'Cancel',

      //== Valid Input =========================================
      'empty_field': "Can't be empty",
      'invalid_username': 'Not valid username',
      'invalid_email': 'Not valid email',
      'invalid_phone': 'Not valid phone number',
      'too_short': "Can't be less than @min characters",
      'too_long': "Can't be more than @max characters",

      //== Login ===============================================
      'sign_in': 'Sign In',
      'welcome_back': 'Welcome Back',
      'login_description':
          'Sign in with your email and password or continue with social media',
      'email': 'Email',
      'enter_email': 'Enter Your Email',
      'password': 'Password',
      'enter_password': 'Enter Your Password',
      'forgot_password': 'Forgot Password?',
      'no_account': "Don't have an account?  ",
      'sign_up': 'Sign Up',

      //== Registration ========================================
      'registration': 'Registration',
      'welcome_family': 'Welcome to the Family',
      'registration_description':
          'Create your account using your username, email, phone number and password',
      'username': 'Username',
      'enter_username': 'Enter Username',
      'phone': 'Phone',
      'enter_phone': 'Enter Your Phone',
      'register': 'Register',
      'have_account': 'Already have an account?  ',

      //== Registration Alert ==================================
      'email_phone_exist': 'The email or phone number already exists',

      //== Verification Code - Sign Up ========================
      'verification_code': 'Verification Code',
      'check_code': 'Check Code',
      'code_sent_to': 'Please enter the verification code sent to @email',

      'wrong_code': 'Incorrect Verification Code',
      'wrong_code_message':
          'The verification code you entered is incorrect. You have @attempts attempts remaining.',

      'no_attempts_left': 'No Attempts Left',
      'no_attempts_message':
          'You have used all verification attempts. You will be redirected to the login page.',

      //== Verification Code - Reset Password =================
      'verification_code_wrong': 'Incorrect Verification Code',

      'verification_code_wrong_message':
          'The verification code you entered is incorrect. Please check the code and try again.',

      'verification_code_attempts_message':
          'The verification code you entered is incorrect. You have @attempts attempts remaining.',

      //== Reset Password ======================================
      'reset_password': 'Reset Password',
      'new_password': 'New Password',
      'enter_new_password': 'Enter Your New Password',
      'enter_your_password': 'Enter Your New Password',
      're_password': 'Re-enter Password',
      're_enter_your_password': 'Re-enter Your Password',
      'save': 'Save',

      'password_not_match': 'Passwords Do Not Match',

      'password_not_match_message':
          'The passwords do not match. Please make sure you entered them correctly.',

      'try_again': 'Something went wrong. Please try again.',

      //== Success =============================================
      'success': 'Success',

      'password_reset_success': 'Password Changed Successfully',

      'password_reset_success_message':
          'Your password has been successfully changed. You can now log in with your new password.',

      'go_to_login': 'Go to Login',

      //== Success Sign Up =====================================
      'congratulations': 'Congratulations',

      'signup_success_message': 'Your account has been successfully created.',

      'account_verified_successfully':
          'Your account has been successfully verified.\nWelcome to the family,\nenjoy a luxurious experience,\nand you can now log in.',

      //== Language ============================================
      'arabic': 'Arabic',
      'english': 'English',
      'choose_language': 'Choose Language',

      //== Onboarding ==========================================
      'onboardingTitle1': 'Choose Your Product',

      'onboarding_Body_1':
          'Choose your product from thousands of options \nwith confidence from our \nintegrated online store.',

      'onboardingTitle2': 'Easy and Safe Payment',

      'onboarding_Body_2':
          'Easy Checkout & Safe Payment\nmethod. Trusted by our Customers\nfrom all over the Sudan.',

      'onboardingTitle3': 'Track Your Order',

      'onboarding_Body_3':
          'Track your order moment by moment \nuntil it reaches you safely \nwherever you are.',

      'onboardingTitle4': 'Fast Delivery',

      'onboarding_Body_4':
          'Reliable And Fast Delivery. We \nDeliver your product the fastest \nway possible.',

      'continue': 'Continue',
    },
  };
}
