import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class CustomButtonOnBoardingWidget extends StatelessWidget {
  const CustomButtonOnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),

      height: 40,
      child: MaterialButton(
        textColor: AppColors.white,
        color: AppColors.primerycolor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 2),
        child: const Text('Continue'),
        onPressed: () {},
      ),
    );
  }
}
