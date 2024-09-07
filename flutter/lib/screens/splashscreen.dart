import 'dart:async';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    // Timer(Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => MainScreen(),  // Replace with your main screen widget
    //   ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,  // Background color for splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',  // Replace with your logo path
              height: 120,
              width: 120,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white,  // Loading indicator
            ),
          ],
        ),
      ),
    );
  }
}