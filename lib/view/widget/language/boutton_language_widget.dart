import 'package:flutter/material.dart';

import 'package:koosh/core/constant/colors.dart';

// --BUTTON LANGUAGE WIDGET--------------------------------------

class BouttonLanguageWidget extends StatelessWidget {
  // --BUTTON TEXT------------------------------------------------
  final String textboutton;

  // --ON PRESSED-------------------------------------------------
  final void Function()? onPressed;

  const BouttonLanguageWidget({
    super.key,
    required this.textboutton,
    this.onPressed,
  });

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTAINER------------------------------------------------
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,

      // --MATERIAL BUTTON-----------------------------------------
      child: MaterialButton(
        color: AppColors.primerycolor,
        onPressed: onPressed,

        // --BUTTON TEXT-------------------------------------------
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
