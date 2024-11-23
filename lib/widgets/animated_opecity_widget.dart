import 'package:flutter/cupertino.dart';
import 'package:test_christmas/app/assets.dart';

class AnimatedOpacityTextWidget extends StatefulWidget {
  final Function onAnimationFinished;
  final Widget child;

  const AnimatedOpacityTextWidget({
    super.key,
    required this.onAnimationFinished,
    required this.child,
  });

  @override
  State<AnimatedOpacityTextWidget> createState() => _AnimatedOpacityTextWidgetState();
}

class _AnimatedOpacityTextWidgetState extends State<AnimatedOpacityTextWidget> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        opacity = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(seconds: 1),
      child: widget.child,
      onEnd: () {
        widget.onAnimationFinished.call();
      },
    );
  }
}
