// lib/core/theme/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color deepBlue = Color(0xFF1A1DFF);
  static const Color boostBlue = Color(0xFF001F54);
  static const Color purple = Color(0xFF8A2BE2);
  static const Color boostPurple = Color(0xCD8A2BE2);

  // Accent Colors
  static const Color brightYellow = Color(0xFFFFC300);
  static const Color orange = Color(0xFFFF5733);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFE0E0E0);

  // Button Colors
  static const Color boostRed = Color(0xaeff3366);
  static const Color backgroundRed = Color(0xff6e0420);
  static const Color deepRed = Color(0x73A80012);   // Example color for gradient end
  static const Color buttonText = Color(0xFFFFFFFF);

  static const Color backgroundCream = Color(0xFFFFF9E6);
  static const Color softGreen = Color(0xFF19FF00);
  static const Color yellowBubble = Color(0xFFFFD000);
  static const Color whiteBubble = Colors.white;
  static const Color blackText = Colors.black;


  // Background Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [backgroundRed, backgroundRed],
    stops: [
      0.4,1
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient cardGradient = LinearGradient(
    colors: [boostBlue,deepRed],
    stops: [
      0.55,1
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient buttonBackgroundGradient = LinearGradient(
    colors: [brightYellow, yellowBubble],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );


  static const RadialGradient focusGradient = RadialGradient(
    colors: [brightYellow, deepBlue],
    center: Alignment.center,
    radius: 0.5,
  );
}
