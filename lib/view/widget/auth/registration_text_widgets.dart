import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class RegistrationTextWidget extends StatelessWidget {
  final String text;
  final String text2;
    final void Function() onTap ;


  const RegistrationTextWidget({
    super.key,
    required this.text,
    required this.text2, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: Theme.of(context).textTheme.bodySmall),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style:const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.primerycolor,
            ),
          ),
        ),
      ],
    );
  }
}
