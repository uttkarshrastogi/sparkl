import 'package:flutter/material.dart';

class StackedCards extends StatefulWidget {
  const StackedCards({Key? key}) : super(key: key);

  @override
  _StackedCardsState createState() => _StackedCardsState();
}

class _StackedCardsState extends State<StackedCards>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define staggered offsets for cards
    _animations = [
      Tween<Offset>(begin: const Offset(-2.0, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.0, 0.25))),
      Tween<Offset>(begin: const Offset(-2.0, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.15, 0.30))),
      Tween<Offset>(begin: const Offset(-2.0, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.20, 0.45))),
      Tween<Offset>(begin: const Offset(-2.0, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
          parent: _controller, curve: const Interval(0.35, 0.50))),
    ];

    // Trigger the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildAnimatedCard(0, _animations[0]),
          _buildAnimatedCard(30, _animations[1]),
          _buildAnimatedCard(60, _animations[2]),
          _buildAnimatedCard(90, _animations[3]),
        ],
      ),
    );
  }

  // Build Animated Card
  Widget _buildAnimatedCard(double topOffset, Animation<Offset> animation) {
    return Positioned(
      top: topOffset,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: animation,
        child: Image.asset(
          "assets/stack_card.png", // Replace with your asset path
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
