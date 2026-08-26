import 'package:flutter/material.dart';
import 'package:koosh/core/constant/colors.dart';

class AnnouncementBar extends StatefulWidget {
  const AnnouncementBar({super.key});

  @override
  State<AnnouncementBar> createState() => _AnnouncementBarState();
}

class _AnnouncementBarState extends State<AnnouncementBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  // النص مؤقتًا ثابت
  String announcementText =
      "🔥 Special offers are available now — Don't miss out!";

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cold,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  constraints.maxWidth -
                      (animationController.value *
                          (constraints.maxWidth + 500)),
                  0,
                ),
                child: child,
              );
            },
            child: Center(
              child: Text(
                announcementText,
                maxLines: 1,
                style: const TextStyle(
                  color: AppColors.primerycolor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
