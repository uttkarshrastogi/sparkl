import 'package:brainboost/core/theme/colors.dart';
import 'package:brainboost/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class BoostCardDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;

  const BoostCardDetailScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag:title ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium, // Title style
                  ),
                ),
              ),
              Hero(
                tag: imageUrl, // The same tag as in the BoostCard
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Transform.rotate(
                    
                    angle: 0,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
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
