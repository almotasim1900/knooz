import 'package:flutter/material.dart';

import 'package:koosh/core/constant/colors.dart';

// --REGISTRATION TEXT WIDGET-----------------------------------

class RegistrationTextWidget extends StatelessWidget {
  // --TEXT-------------------------------------------------------
  final String text;

  // --TEXT 2-----------------------------------------------------
  final String text2;

  // --ON TAP-----------------------------------------------------
  final void Function() onTap;

  // --CONSTRUCTOR-----------------------------------------------
  const RegistrationTextWidget({
    super.key,
    required this.text,
    required this.text2,
    required this.onTap,
  });

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --ROW-------------------------------------------------------
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // --FIRST TEXT--------------------------------------------
        Text(text, style: Theme.of(context).textTheme.bodySmall),

        // --SECOND TEXT-------------------------------------------
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
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
