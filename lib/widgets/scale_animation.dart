import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({
    super.key,
    required this.child,
    this.begin,
    this.end,
    this.duration,
    this.delayDuration,
    required this.onAnimationFinished,
  });

  final Widget child;
  final double? begin;
  final double? end;
  final Duration? duration;
  final Duration? delayDuration;
  final Function onAnimationFinished;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration ?? const Duration(milliseconds: 800));
    Future.delayed(widget.delayDuration ?? const Duration(seconds: 0)).then(
      (value) {
        animationController.forward().then((e) {
          widget.onAnimationFinished.call();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: widget.begin ?? 0.1, end: widget.end ?? 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
      ),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
