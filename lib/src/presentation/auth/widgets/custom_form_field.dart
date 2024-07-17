import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  final String hintText;
  final bool isPassword;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? isPasswordVisible : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  setState(() => isPasswordVisible = !isPasswordVisible);
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
