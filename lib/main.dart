import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme/app_theme.dart';
import 'package:spotify_app/src/presentation/splash/screens/splash_screen.dart';

void main() {
  runApp(const SpotifyApp());
}

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
