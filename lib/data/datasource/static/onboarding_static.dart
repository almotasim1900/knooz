//onboarding بيانات الصفحة الاولي )(onboarding)
import 'package:get/get.dart';
import 'package:koosh/core/constant/onboardingimage.dart';
import 'package:koosh/model/onboardingmodel.dart';

List<OnBoardingModel>get onBoardingList => [
  // الصفحة الاولي
  OnBoardingModel(title:'onboardingTitle1'.tr,image:OnBoardingImage.onBoardingImageOne ,
  body: 'onboarding_Body_1'.tr
 ),
 // الصفحة الثانية
 OnBoardingModel(title: 'onboardingTitle2'.tr,image:OnBoardingImage.onBoardingImageTwo ,
  body: 'onboarding_Body_2'.tr
 ),
 // الصفحة الثالثة
 OnBoardingModel(title:'onboardingTitle3'.tr,image:OnBoardingImage.onBoardingImageThree ,
  body: 'onboarding_Body_3'.tr
 ),
 // الصفحة الرابعة
 OnBoardingModel(title:'onboardingTitle4'.tr,image:OnBoardingImage.onBoardingImageFour ,
  body: 'onboarding_Body_4'.tr
 ),

];
