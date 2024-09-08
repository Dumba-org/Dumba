import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/color.dart';
import 'main_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainScreen(),  // Replace with your main screen widget
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Background color for splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo1.png',  // Replace with your logo path
              height: 120,
              width: 120,
            ),
            const Text("Your Home Doctor", style: TextStyle(fontSize: 12, color: Colors.grey)),  // App name
            const SizedBox(height: 20),
             CircularProgressIndicator(
              color:primaryColor,  // Loading indicator
            ),
          ],
        ),
      ),
    );
  }
}