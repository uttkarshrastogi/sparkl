import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'camera_with_lottie_widget.dart';

class LottieWithLabels extends StatelessWidget {
  const LottieWithLabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Lottie Animation at Center
          Lottie.asset(
            width: 500,  // Adjust width
            height: 400,
            fit: BoxFit.fill,
            "assets/sparkl_shape_shift_lottie.json",
          ),
          CameraWithLottieWidget( width: 250,  // Adjust width
            height: 250,),
          // Positioned elements around the Lottie animation

        ],
      ),
    );
  }

  // Helper Widget for Label
  Widget _buildIcon(String text, String iconPath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circular Icon with Image
        DottedBorder(
          borderType: BorderType.RRect,
          color:  Colors.amber,
          radius: const Radius.circular(300),
          child: Container(
              width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Image.asset(iconPath), // Icon Image
          ),
        ),

      ],
    );
  }
  Widget _buildLabel(String text, String iconPath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Circular Icon with Image
        DottedBorder(
          borderType: BorderType.RRect,
          color:  Colors.amber,
          radius: Radius.circular(12),
          child: Container(

            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
