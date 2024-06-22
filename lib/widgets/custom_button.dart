import 'package:flutter/material.dart';

import '../core/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
        backgroundColor: MaterialStateProperty.all(GlobalColors.primaryColor),
      ),
      child: Text(
        text,
        style:const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}