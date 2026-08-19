import 'package:flutter/material.dart';

import 'package:koosh/core/constant/colors.dart';

// --CUSTOM BUTTON AUTH------------------------------------------

class CustomButtonAuth extends StatelessWidget {
  // --BUTTON TEXT------------------------------------------------
  final String text;

  // --ON PRESSED-------------------------------------------------
  final void Function()? onPressed;

  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTAINER------------------------------------------------
    return Container(
      margin: EdgeInsets.only(top: 10),

      // --MATERIAL BUTTON-----------------------------------------
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColors.primerycolor,
        textColor: AppColors.white,

        // --BUTTON TEXT-------------------------------------------
        child: Text(text),
      ),
    );
  }
}
