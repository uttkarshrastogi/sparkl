// lib/core/theme/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color deepBlue = Color(0xFF1A1DFF);
  static const Color purple = Color(0xFF8A2BE2);
  static const Color boostPurple = Color(0xCD8A2BE2);

  // Accent Colors
  static const Color brightYellow = Color(0xFFFFC300);
  static const Color orange = Color(0xFFFF5733);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFE0E0E0);

  // Button Colors
  static const Color boostRed = Color(0xaeff3366); // Example color for gradient end
  static const Color buttonText = Color(0xFFFFFFFF);

  // Background Gradients
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [deepBlue, purple],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Background Gradients
  static const List<Color> buttonBackgroundGradient = [boostRed, boostPurple];

  static const RadialGradient focusGradient = RadialGradient(
    colors: [brightYellow, deepBlue],
    center: Alignment.center,
    radius: 0.5,
  );
}
