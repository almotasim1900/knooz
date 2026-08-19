import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:koosh/core/functions/check_internet.dart';

// --TEST WIDGET-------------------------------------------------
class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _TestState();
}
// --STATE--------------------------------------------------------

class _TestState extends State<Test> {
  // --VARIABLES--------------------------------------------------
  var res;

  // --INITIAL DATA-----------------------------------------------
  Future<void> intialdata() async {
    res = await checkInternet();
    print(res);
  }

  // --INIT STATE-------------------------------------------------
  @override
  void initState() {
    intialdata();
    super.initState();
  }

  // --BUILD------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --APP BAR-------------------------------------------------
      appBar: AppBar(
        title: const Text(
          'Verification Code',
        ), // تصحيح العنوان ليصبح Text وليس استدعاء للصفحة
      ),

      // --BODY----------------------------------------------------
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // --OTP TEXT FIELD------------------------------------
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 4,
              borderRadius: BorderRadius.circular(20),
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: true,

              // --CODE CHANGED------------------------------------
              onCodeChanged: (String code) {},

              // --SUBMIT------------------------------------------
              onSubmit: (String verificationCode) {},
            ),
          ],
        ),
      ),
    );
  }
}
