//onboarding بيانات الصفحة الاولي )(onboarding)
import 'package:koosh/core/constant/onboardingimage.dart';
import 'package:koosh/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  // الصفحة الاولي
  OnBoardingModel(title: 'Choose Product',image:OnBoardingImage.onBoardingImageOne ,
  body: 'We Have a 100k Product Choose \n Your Product From\n Our E-Commerce Shope '
 ),
 // الصفحة الثانية
 OnBoardingModel(title: 'Easy and Safe Payment',image:OnBoardingImage.onBoardingImageTwo ,
  body: 'Easy Checkout & Safe Payment\n method. Trusted by our Customers\n from all over the Sudan.'
 ),
 // الصفحة الثالثة
 OnBoardingModel(title: 'Track Your Order',image:OnBoardingImage.onBoardingImageThree ,
  body: 'Best Tracker has been Used For\n Track your order. You’ll know where\n your product is at the moment. '
 ),
 // الصفحة الرابعة
 OnBoardingModel(title: 'Fast Delivery',image:OnBoardingImage.onBoardingImageFour ,
  body: 'Reliable And Fast Delivery. We \nDeliver your product the fastest \n way possible. '
 ),

];
