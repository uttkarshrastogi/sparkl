import 'package:brainboost/core/theme/colors.dart';
import 'package:brainboost/core/widgets/boost_card.dart';
import 'package:brainboost/features/GameMenu/presentation/pages/boost_card_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ParallaxCardSlider extends StatefulWidget {
  @override
  _ParallaxCardSliderState createState() => _ParallaxCardSliderState();
}

class _ParallaxCardSliderState extends State<ParallaxCardSlider> {
  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);
  double _currentPage = 0;
  final int _numCards = 5; // Define the number of cards here

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _numCards, // Number of cards
            itemBuilder: (context, index) {
              // This ensures that the initial scale works without interaction
              double scale = (_pageController.hasClients)
                  ? (1 -
                      ((_pageController.page ?? _currentPage) - index).abs() *
                          0.2)
                  : (index == 0
                      ? 1.0
                      : 0.8); // Apply a default scale for the first page

              scale =
                  scale.clamp(0.8, 1.0); // Ensure the scale is within bounds

              return Transform.scale(
                scale: scale, // Apply the parallax scale
                child: Opacity(
                  opacity: scale.clamp(0.8, 1.0), // Add a fading effect
                  child: BoostCard(
                    title: 'Card Title $index',
                    description: '10 games',
                    imageUrl:
                        'assets/images/figure${index + 1}.png', // Example image
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        SmoothPageIndicator(
          controller: _pageController, // PageController
          count: _numCards, // Number of cards
          effect: const ExpandingDotsEffect(
            expansionFactor: 1.1,
            spacing: 30,
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: AppColors.white, // You can customize the color
            dotColor: Colors.white10, // Inactive dot color
          ),
        ),
        SizedBox(height: 20), // Adjust the spacing as needed
      ],
    );
  }
}
