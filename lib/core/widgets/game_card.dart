
import 'package:flutter/material.dart';
import '../theme/spacing.dart';
import '../theme/text_styles.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final VoidCallback onPlay;

  GameCard({required this.title, required this.imageAsset, required this.onPlay});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imageAsset),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Text(title, style: AppTextStyles.headlineMedium),
          ),
          ElevatedButton(
            onPressed: onPlay,
            child: const Text('Play'),
          ),
        ],
      ),
    );
  }
}
