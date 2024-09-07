import 'package:flutter/material.dart';

class CustomSnackBarWidget extends StatelessWidget {
  // const CustomSnackBarWidget({super.key});

  final String message;

  const CustomSnackBarWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      
    );
  }
}
