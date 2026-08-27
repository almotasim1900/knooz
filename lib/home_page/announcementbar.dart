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

  //==========================================================
  // نص الإعلان
  //==========================================================

  String announcementText =
      "🔥 Special offers are available now — Don't miss out!";

  @override
  void initState() {
    super.initState();

    //==========================================================
    // حركة النص
    //==========================================================

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
        //======================================================
        // الخلفية البنفسجية الملكية
        //======================================================
        color: AppColors.announcementPurpleDark,

        //======================================================
        // الحواف
        //======================================================
        borderRadius: BorderRadius.circular(10),

        //======================================================
        // إطار ذهبي خفيف
        //======================================================
        border: Border.all(color: AppColors.announcementGoldDark, width: 1),

        //======================================================
        // ظل خفيف يعطي فخامة
        //======================================================
        boxShadow: [
          BoxShadow(
            color: AppColors.announcementPurpleDark.withValues(alpha: 0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
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

            //====================================================
            // نص الإعلان
            //====================================================
            child: Center(
              child: Text(
                announcementText,

                maxLines: 1,

                style: const TextStyle(
                  //================================================
                  // اللون الذهبي
                  //================================================
                  color: AppColors.announcementGold,

                  fontSize: 14,

                  fontWeight: FontWeight.bold,

                  //================================================
                  // مسافة بسيطة بين الحروف
                  //================================================
                  letterSpacing: 0.3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
