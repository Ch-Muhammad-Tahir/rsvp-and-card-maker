import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  final Widget child;
  final Tween<double>? tween;
  final double? begin;
  final double? end;
  final Duration? duration;
  final Curve? curve;

  const TweenAnimation({
    super.key,
    required this.child,
    this.tween,
    this.begin,
    this.end,
    this.duration,
    this.curve,
  });

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 4),
    );
    _animation = (widget.tween ??
            Tween<double>(begin: widget.begin ?? 0, end: widget.end ?? 1.0))
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );
    startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    _controller.forward();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
