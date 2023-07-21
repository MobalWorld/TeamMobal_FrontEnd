import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    await Future.delayed(Duration(seconds: 2)); // Adjust the duration as needed
    Get.to(LoginPage()); // Replace with the route for your main screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color of your splash screen
        child: Center(
          child: Icon(
            Icons.water_drop_outlined,
            size: 100,
          ), // Replace 'splash.png' with the actual image file name
        ),
      ),
    );
  }
}
