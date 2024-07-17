import 'package:flutter/material.dart';
import 'package:spotify_app/core/extensions/is_dark_mode_extensions.dart';
import 'package:spotify_app/core/extensions/navigation_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? Text(''),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withOpacity(0.03)
                : Colors.black.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
