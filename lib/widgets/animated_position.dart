import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({
    super.key,
    required this.child,
    this.showTop = true,
    this.begin,
    this.end,
    required this.onAnimationFinished,
    this.duration,
    this.delayDuration,
  });

  final Widget child;
  final bool showTop;
  final double? begin;
  final double? end;
  final Function onAnimationFinished;
  final Duration? duration;
  final Duration? delayDuration;

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isGiftBoxShowing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: widget.begin ?? -100, end: widget.end ?? 0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    Future.delayed(widget.delayDuration ?? const Duration(milliseconds: 3000)).then(
      (value) {
        isGiftBoxShowing = true;
        setState(() {});
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            _controller.forward().then(
              (value) {
                widget.onAnimationFinished.call();
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: widget.showTop ? _animation.value : 0,
          bottom: widget.showTop ? 0 : _animation.value,
          child: isGiftBoxShowing ? widget.child : const SizedBox(),
        ),
      ],
    );
  }
}
