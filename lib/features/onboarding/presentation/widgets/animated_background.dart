import 'dart:math';
import 'dart:ui';
import 'package:brainboost/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class AnimatedBlurredBalls extends StatefulWidget {
  final Widget body;

  const AnimatedBlurredBalls({
  required this.body
  });
  @override
  _AnimatedBlurredBallsState createState() => _AnimatedBlurredBallsState();
}

class _AnimatedBlurredBallsState extends State<AnimatedBlurredBalls>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Ball> _balls;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    // Initialize balls with specific colors
    _balls = [
      Ball.randomWithColor( AppColors.yellowBubble), // Yellow Ball
      Ball.randomWithColor(AppColors.softGreen),
      Ball.randomWithColor( AppColors.yellowBubble), // Yellow Ball
      Ball.randomWithColor(AppColors.softGreen), // Soft Green Ball
    ];

    // Update ball positions on every frame
    _controller.addListener(() {
      for (var ball in _balls) {
        ball.updatePosition();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated blurred balls
          ..._balls.map((ball) {
            return Positioned(
              top: ball.y - ball.radius,
              left: ball.x - ball.radius,
              child: SizedBox(
                width: ball.radius * 2,
                height: ball.radius * 2,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60), // Blur effect
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          ball.color.withOpacity(0.9), // Outer glow
                          ball.color.withOpacity(0),   // Fade to transparent
                        ],
                        stops: [0.5, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          // Semi-transparent overlay (Soft Cream Background)
          Container(
            color:  AppColors.backgroundCream.withOpacity(0.7),
          ),
          widget.body
        ],
      ),
    );
  }
}

class Ball {
  static final Random _random = Random();

  double x = 0;
  double y = 0;
  double dx = 0;
  double dy = 0;
  double radius = 120; // Larger radius
  Color color;

  Ball(this.x, this.y, this.dx, this.dy, this.radius, this.color);

  // Generate a ball with a specific color
  factory Ball.randomWithColor(Color color) {
    final double radius = _random.nextDouble() * 50 + 100; // Larger radius
    final double dx = (_random.nextDouble() * 4 - 2);
    final double dy = (_random.nextDouble() * 4 - 2);
    return Ball(
      _random.nextDouble() * 400, // Random x position
      _random.nextDouble() * 800, // Random y position
      dx,
      dy,
      radius,
      color,
    );
  }

  // Update ball position
  void updatePosition() {
    x += dx;
    y += dy;

    // Bounce off walls
    if (x < radius || x > 400 - radius) dx = -dx;
    if (y < radius || y > 800 - radius) dy = -dy;
  }
}
