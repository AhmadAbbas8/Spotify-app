import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/extensions/navigation_extensions.dart';
import 'package:spotify_app/core/utils/app_assets.dart';
import 'package:spotify_app/core/widgets/basic_app_button.dart';
import 'package:spotify_app/core/widgets/custom_appbar.dart';
import 'package:spotify_app/src/data/models/auth/create_user_req.dart';
import 'package:spotify_app/src/domain/use_cases/auth/signup_use_case.dart';
import 'package:spotify_app/src/presentation/auth/screens/signin_screen.dart';
import 'package:spotify_app/src/presentation/home/screens/home_screen.dart';
import '../../../../core/service_locator.dart';
import '../widgets/custom_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

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
        child: SingleChildScrollView(
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
              CustomFormField(
                hintText: 'Full Name',
                controller: _fullName,
              ),
              const SizedBox(height: 20),
              CustomFormField(
                hintText: 'Enter Email',
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomFormField(
                hintText: 'Password',
                controller: _password,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : BasicAppButton(
                      onPressed: () async {
                        setState(() => isLoading = true);
                        var res = await sl<SignUpUseCase>().call(
                          params: CreateUserReq(
                            fullName: _fullName.text,
                            email: _email.text,
                            password: _password.text,
                          ),
                        );
                        setState(() => isLoading = false);
                        res.fold(
                          (l) {
                            var snackbar = SnackBar(
                              content: Text(l),
                              behavior: SnackBarBehavior.floating,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          },
                          (r) {
                            context.pushAndRemoveUntil(
                              const HomeScreen(),
                              (route) => false,
                            );
                          },
                        );
                      },
                      title: 'Create Account',
                    ),
            ],
          ),
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

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    _fullName.dispose();
    super.dispose();
  }
}
