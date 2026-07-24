import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class BouttonLanguageWidget extends StatelessWidget {
  final String textboutton;
  final void Function()? onPressed;
  const BouttonLanguageWidget({super.key, required this.textboutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.primerycolor,
        onPressed: onPressed,
        child: Text(
          textboutton,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
