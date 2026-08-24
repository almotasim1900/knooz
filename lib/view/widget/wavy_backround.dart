import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class WavyPurplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // --PAINT----------------------------------------------------

    final Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.wavePurpleLight,
          AppColors.wavePurple,
          AppColors.wavePurpleDark,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // --PATH----------------------------------------------------

    final Path path = Path();

    // --START LEFT----------------------------------------------

    path.moveTo(0, size.height * 0.40);

    // --FIRST WAVE----------------------------------------------

    path.cubicTo(
      size.width * 0.20,
      size.height * 0.05,
      size.width * 0.35,
      size.height * 0.85,
      size.width * 0.52,
      size.height * 0.45,
    );

    // --SECOND WAVE---------------------------------------------

    path.cubicTo(
      size.width * 0.70,
      size.height * 0.05,
      size.width * 0.82,
      size.height * 0.90,
      size.width,
      size.height * 0.35,
    );

    // --RIGHT SIDE----------------------------------------------

    path.lineTo(size.width, size.height);

    // --BOTTOM--------------------------------------------------

    path.lineTo(0, size.height);

    path.close();

    // --DRAW----------------------------------------------------

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
