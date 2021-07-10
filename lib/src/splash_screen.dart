import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fearlessassemble/src/app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 500,
      splash: 'assets/images/splash_image.png',
      nextScreen: App(),
      splashTransition: SplashTransition.rotationTransition,
      duration: 2500,
    );
  }
}
