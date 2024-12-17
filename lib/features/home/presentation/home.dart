import 'package:brainboost/core/theme/colors.dart';
import 'package:brainboost/core/theme/spacing.dart';
import 'package:brainboost/core/widgets/boost_button.dart';
import 'package:brainboost/core/widgets/parallax_card_slider.dart';
import 'package:brainboost/features/home/presentation/widgets/boost_navbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/boost_card.dart';
import '../../../core/widgets/boost_chips.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover, // Adjust as needed
            ),
            gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:  AppSpacing.sm,vertical: AppSpacing.xs),
                child: Text(
                  "Games",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal:  AppSpacing.sm,vertical: 0),
                 child: BoostChips(),
               ),
              const Gap(25),
              Expanded(child: ParallaxCardSlider()),



            ],
          ),
        ),
      ),
    );
  }
}
