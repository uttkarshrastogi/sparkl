import 'package:flutter/material.dart';
import 'package:brainboost/core/theme/colors.dart'; // Update import path as needed

class BoostButton extends StatelessWidget {
  final String text; // Reusable text
  final VoidCallback onPressed; // Reusable onPressed callback
  final Color? textColor; // Optional customizable text color
  final List<Color>? gradientColors; // Optional customizable gradient colors

  const BoostButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brightYellow,
        gradient: AppColors.buttonBackgroundGradient,
        border: Border.all(color: Colors.white10,width: 3),
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make background transparent for gradient
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          shadowColor: Colors.transparent, // Remove ElevatedButton shadow
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: textColor ?? AppColors.buttonText, // Default to white text
          ),
        ),
      ),
    );
  }
}
