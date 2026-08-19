import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

// --CUSTOM SIGN IN FORM FIELD----------------------------------

class CustomSignInFormField extends StatelessWidget {
  // --VARIABLES-------------------------------------------------
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController authController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  // --CONSTRUCTOR-----------------------------------------------
  const CustomSignInFormField({
    super.key,
    this.obscureText,
    this.onTapIcon,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.authController,
    required this.isNumber,

    required this.valid,
  });

  // --BUILD-----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --CONTAINER------------------------------------------------
    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      // --TEXT FORM FIELD----------------------------------------
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,

        // --KEYBOARD TYPE----------------------------------------
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,

        // --VALIDATOR--------------------------------------------
        // اضافة التحقق
        validator: valid,

        // --CONTROLLER-------------------------------------------
        controller: authController,

        // --DECORATION-------------------------------------------
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12, color: AppColors.gray),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),

          // --LABEL---------------------------------------------
          label: Container(
            //ادخلنهو دال كونتينر عشان نديهو مارجن
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labeltext),
          ),

          // --SUFFIX ICON----------------------------------------
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),

          // --BORDER---------------------------------------------
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
