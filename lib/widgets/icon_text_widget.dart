import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(12, context), vertical: AppLayout.getWidth(12, context)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getHeight(10, context)),
        ),
        child: Row(
            children: [
              Icon(icon, color: const Color(0xFFBFC2DF)),
              Gap(AppLayout.getHeight(25, context)),
              Text(text, style: Styles.textStyle)
            ]
        )
    );
  }
}
