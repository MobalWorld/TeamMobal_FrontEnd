import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../login/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    // Wait for a few seconds and then navigate to the main screen
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Adjust the duration as needed
    Get.to(LoginPage()); // Replace with the route for your main screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color of your splash screen
        child: Center(
          child: RiveAnimation.asset(
            'assets/rive/splash.riv', // Use the RiveAnimation.asset widget
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
        ),
      ),
    );
  }
}
