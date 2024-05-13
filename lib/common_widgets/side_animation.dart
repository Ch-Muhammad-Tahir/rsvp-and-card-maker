import 'package:flutter/material.dart';

enum SlideDirection { left, right, up, down }

class SideAnimation extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  final double startOffset;
  final VoidCallback? onComplete;

  const SideAnimation({
    super.key,
    required this.child,
    required this.direction,
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
    this.repeat = false,
    this.reverse = false,
    this.startOffset = 0.0,
    this.onComplete,
  });

  @override
  State<SideAnimation> createState() => _SideAnimationState();
}

class _SideAnimationState extends State<SideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _setupAnimation();

    if (widget.reverse) {
      _controller.reverse(from: widget.startOffset);
    } else {
      _controller.forward(from: widget.startOffset);
    }

    if (widget.repeat) {
      _controller.repeat(reverse: widget.reverse);
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.onComplete != null) {
        widget.onComplete!();
      }
    });
  }

  void _setupAnimation() {
    switch (widget.direction) {
      case SlideDirection.left:
        _animation = Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: widget.curve,
        ));
        break;
      case SlideDirection.right:
        _animation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: widget.curve,
        ));
        break;
      case SlideDirection.up:
        _animation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: widget.curve,
        ));
        break;
      case SlideDirection.down:
        _animation = Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: widget.curve,
        ));
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
