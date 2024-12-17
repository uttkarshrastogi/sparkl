import 'package:flutter/material.dart';

import '../../../../core/widgets/boost_button.dart';
import '../widgets/animated_background.dart';
import '../widgets/lottie_with_label_widget.dart';
import 'onboarding_screen_two.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBlurredBalls(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Sparkl Logo
              Hero(
                tag: 1,
                child: Image.asset(
                  'assets/sparkl_logo.png', // Replace with your asset path
                  height: 60,
                ),
              ),
              const SizedBox(height: 20),
              // Main Heading
              Hero(
                tag: 2,
                child: const Text(
                  "Learning made personal",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Subheading
              Hero(
                tag: 3,
                child: const Text(
                  "A program designed just for you",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
              Spacer(),
              LottieWithLabels(),
              // Lottie Animation
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: BoostButton(
                      text: "Next",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return OnboardingScreenTwo(
                              );
                            }));
                      },
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
