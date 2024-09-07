import 'package:flutter/material.dart';

class TextfieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final String label;
  // final IconData icon;
  final TextInputType inputType;

  const TextfieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.inputType,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        label: Text(hintText),
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: inputType,
      obscureText: isPass,
    );
  }
}