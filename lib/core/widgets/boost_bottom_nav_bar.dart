// lib/core/widgets/boost_bottom_nav_bar.dart
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';


class BoostBottomNavBar extends StatelessWidget {
  const BoostBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.deepBlue,
      selectedItemColor: AppColors.brightYellow,
      unselectedItemColor: AppColors.lightGray,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(AppIcons.brain),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.puzzlePiece),
          label: 'Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.arrow),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.lightbulb),
          label: 'Settings',
        ),
      ],
    );
  }
}
