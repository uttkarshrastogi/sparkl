import 'package:brainboost/features/onboarding/presentation/pages/onboarding_screen_one.dart';
import 'package:brainboost/features/onboarding/presentation/pages/onboarding_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/widgets/boost_button.dart';
import '../widgets/animated_background.dart';
import '../widgets/lottie_with_label_widget.dart';
import '../widgets/onboarding_page_widget.dart';
import '../widgets/stack_card.dart';
import 'onboarding_screen_three.dart';


class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          OnboardingScreenThree(),
          OnboardingScreenOne(),
          OnboardingScreenTwo(),

          const OnboardingPage(
            title: "Doubt Resolution with Teacher",
            description: "Description for page 3",
            lottieFile: 'assets/emoji.png',
            image: 'assets/sparkl_logo.png',
          ),
        ],
      ),
    );
  }
}
