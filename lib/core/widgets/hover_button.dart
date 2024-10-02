// Example widget with hover effect
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const HoverButton({super.key, required this.child, required this.onPressed});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (_) => _setHovering(true),
      onTapUp: (_) => _setHovering(false),
      onTapCancel: () => _setHovering(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovering ? AppColors.orange : AppColors.brightYellow,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: _isHovering
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }

  void _setHovering(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}
