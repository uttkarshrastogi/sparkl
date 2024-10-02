// lib/core/widgets/boost_progress_indicator.dart
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class BoostProgressIndicator extends StatelessWidget {
  final double progress;

  const BoostProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: AppColors.lightGray,
      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brightYellow),
    );
  }
}
