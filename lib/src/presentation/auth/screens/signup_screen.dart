import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/navigation_extensions.dart';
import 'package:spotify_app/core/utils/app_assets.dart';
import 'package:spotify_app/core/widgets/basic_app_button.dart';
import 'package:spotify_app/core/widgets/custom_appbar.dart';
import 'package:spotify_app/src/presentation/auth/screens/signin_screen.dart';
import '../widgets/custom_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              'Register',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const CustomFormField(
              hintText: 'Full Name',
            ),
            const SizedBox(height: 20),
            const CustomFormField(
              hintText: 'Enter Email',
            ),
            const SizedBox(height: 20),
            const CustomFormField(
              hintText: 'Password',
              isPassword: true,
            ),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () {},
              title: 'Create Account',
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
              'Do You Have An Account? ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () => context.pushReplacement(const SignInScreen()),
              child: const Text(
                'Sign In',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
