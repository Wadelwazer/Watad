import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:watad/constant/my_color.dart';
import 'package:watad/main.dart';
import 'package:watad/presintation/screen/Auth/login.dart';
import 'package:watad/presintation/screen/Tips/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool tips = false;
  @override
  void initState() {
    if (sharedpref.getString("tips") == "1") {
      tips = false;
    } else {
      tips = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: color,
        ),
        child: AnimatedSplashScreen(
            duration: 3000,
            splash: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/logo.png",
                    width: 300,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ]),
            splashIconSize: 200,
            nextScreen: tips ? const Login() : OnBoarding(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.transparent));
  }
}
