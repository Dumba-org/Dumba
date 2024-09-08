import 'package:flutter/material.dart';

import '../main_screen.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Circle
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF001F54), // Dark Blue Background
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/thank.png', // Replace with the actual image URL
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Thank You Text
              Text(
                'Thank you!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF27AE60), // Green Color
                ),
              ),
              SizedBox(height: 12),

              // Subtext
              Text(
                'Thank you for submitting your details.\nWe will contact you as soon as possible.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),

              // Back to Home Button
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        const MainScreen(), // Replace with your main screen widget
                  ));
                },
                child: Text(
                  'Back to home',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF27AE60), // Green Button Color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
