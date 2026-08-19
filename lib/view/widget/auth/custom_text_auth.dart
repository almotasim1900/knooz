import 'package:flutter/material.dart';

// --CUSTOM TEXT AUTH--------------------------------------------

class CustomTextAuth extends StatelessWidget {
  // --TEXT-------------------------------------------------------
  final String text;

  // --CONSTRUCTOR-----------------------------------------------
  const CustomTextAuth({super.key, required this.text});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --TEXT------------------------------------------------------
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
