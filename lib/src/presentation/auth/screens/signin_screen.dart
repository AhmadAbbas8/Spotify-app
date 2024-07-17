import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/navigation_extensions.dart';
import 'package:spotify_app/src/presentation/auth/screens/signup_screen.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/basic_app_button.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/custom_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SvgPicture.asset(
          AppAssets.spotifyLogo,
          width: 39,
          height: 39,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const CustomFormField(
              hintText: 'Enter Email',
            ),
            const SizedBox(height: 20),
            const CustomFormField(
              hintText: 'Password',
            ),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () {},
              title: 'Sign In',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not A Member ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () => context.pushReplacement(const SignUpScreen()),
              child: const Text(
                'Register Now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
