import 'package:flutter/material.dart';

// --CUSTOM TEXT BODY AUTH---------------------------------------

class CustomTextBodyAuth extends StatelessWidget {
  // --TEXT-------------------------------------------------------
  final String text;

  // --CONSTRUCTOR-----------------------------------------------
  const CustomTextBodyAuth({super.key, required this.text});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTAINER------------------------------------------------
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),

      // --TEXT----------------------------------------------------
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
