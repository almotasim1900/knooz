import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class CustomSignInFormField extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController authController;

  const CustomSignInFormField({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData, required this.authController,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: authController,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12, color: AppColors.gray),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          label: Container(
            //ادخلنهو دال كونتينر عشان نديهو مارجن
            margin: const EdgeInsets.symmetric(horizontal: 9),

            child: Text(labeltext),
          ),
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
