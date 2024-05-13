import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  final double startOpacity;
  final double endOpacity;
  final VoidCallback? onComplete;

  const FadeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeInOut,
    this.repeat = false,
    this.reverse = false,
    this.startOpacity = 0.0,
    this.endOpacity = 1.0,
    this.onComplete,
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _setupAnimation();

    if (widget.reverse) {
      _controller.reverse(from: widget.startOpacity);
    } else {
      _controller.forward(from: widget.startOpacity);
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
    _animation = Tween<double>(
      begin: widget.startOpacity,
      end: widget.endOpacity,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
