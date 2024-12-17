import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';

class AnimatedChatBubble extends StatefulWidget {
  final String message;
  final BubbleType bubbleType;
  final Duration delay;

  const AnimatedChatBubble({
    Key? key,
    required this.message,
    required this.bubbleType,
    this.delay = const Duration(milliseconds: 0),
  }) : super(key: key);

  @override
  State<AnimatedChatBubble> createState() => _AnimatedChatBubbleState();
}

class _AnimatedChatBubbleState extends State<AnimatedChatBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    // Trigger animation after the delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: ChatBubble(
        alignment: widget.bubbleType == BubbleType.sendBubble
            ? Alignment.topRight
            : Alignment.topLeft,
        clipper: ChatBubbleClipper1(type: widget.bubbleType),
        backGroundColor: widget.bubbleType == BubbleType.sendBubble
            ? const Color(0xFFFDE47D)
            : Colors.white,
        margin: const EdgeInsets.only(top: 10),
        child: Container(
          constraints: const BoxConstraints(maxWidth:300),
          child: Padding(
            padding:widget.bubbleType == BubbleType.sendBubble
                ? const EdgeInsets.fromLTRB(8,8,24,0)
                : const EdgeInsets.fromLTRB(40,8,8,0),
            child: Text(
              widget.message,
              style: TextStyle(
                color: widget.bubbleType == BubbleType.sendBubble
                    ? Colors.black87
                    : Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
