import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/navigation_extensions.dart';
import 'package:spotify_app/src/presentation/auth/screens/signup_or_signin_screen.dart';
import 'package:spotify_app/src/presentation/choose_mode/logic/theme_cubit/theme_cubit.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/basic_app_button.dart';
import '../widgets/custom_button_mode_option.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.chooseModeBG),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppAssets.spotifyLogo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonModeOption(
                      iconPath: AppAssets.moon,
                      title: 'Dark Mode',
                      onTap: () => context
                          .read<ThemeCubit>()
                          .updateThemeMode(ThemeMode.dark),
                    ),
                    SizedBox(width: 20),
                    CustomButtonModeOption(
                      iconPath: AppAssets.sun,
                      title: 'Light Mode',
                      onTap: () => context
                          .read<ThemeCubit>()
                          .updateThemeMode(ThemeMode.light),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                BasicAppButton(
                  onPressed: () => context.push(const SignUpOrSignInScreen()),
                  title: 'Continue',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
