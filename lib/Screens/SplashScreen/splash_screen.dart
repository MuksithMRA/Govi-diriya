import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:govidiriya/Widgets/Common%20Widgets/responsive_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 150,
      splash: Image.asset(
        'assets/logoL.png',
      ),
      nextScreen: const ResWrapper(),
    );
  }
}
