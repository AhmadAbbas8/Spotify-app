import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/theme/app_colors.dart';

class CustomButtonModeOption extends StatelessWidget {
  const CustomButtonModeOption({
    super.key,
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff30393C).withOpacity(0.5),
              ),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}
