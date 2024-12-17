import 'package:brainboost/core/theme/colors.dart';
import 'package:brainboost/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class BoostChips extends StatefulWidget {
  const BoostChips({super.key});

  @override
  _BoostChipsState createState() => _BoostChipsState();
}

class _BoostChipsState extends State<BoostChips> {
  // List of chip labels
  List<String> chipLabels = ['ALL', 'POPULAR', 'RECOMMENDED'];

  // To keep track of selected chip
  int selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          spacing: 8.0,
          children: List<Widget>.generate(chipLabels.length, (int index) {
            bool isSelected = selectedChipIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedChipIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal:  AppSpacing.sm, vertical: AppSpacing.xs),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isSelected ? AppColors.brightYellow: Colors.white10,
                    width: 2.2,
                  ),
                ),
                child: Text(
                  chipLabels[index],
                  style: TextStyle(
                    color: isSelected ? AppColors.brightYellow : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
