import 'package:flutter/material.dart';
import 'package:brainboost/core/theme/colors.dart';
import 'package:brainboost/core/theme/spacing.dart';
import 'package:gap/gap.dart';
import '../../features/GameMenu/presentation/pages/boost_card_detail_screen.dart';
 // Import the new screen

class BoostCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;

  const BoostCard({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl = '',
  });

  @override
  _BoostCardState createState() => _BoostCardState();
}

class _BoostCardState extends State<BoostCard> with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
   // Reverse to move back and forth smoothly

    // Define a Tween for the movement (slight up/down, left/right)
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to new screen with hero animation
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BoostCardDetailScreen(
              title: widget.title,
              imageUrl: widget.imageUrl,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white10, width: 3),
          borderRadius: BorderRadius.circular(24.0),
          gradient: AppColors.cardGradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.imageUrl.isNotEmpty)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Hero(
                    tag: widget.imageUrl, // Use the image URL as the hero tag
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Gap(16.0),
                Hero(
                  tag:widget.title ,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const Gap(8.0),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.brightYellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
