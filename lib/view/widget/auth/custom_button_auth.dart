import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20 )),
        padding: EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColors.primerycolor,
        textColor: AppColors.white,
        child: Text(text),
      ),
    );
  }
}
