import 'package:flutter/material.dart';

class TweenAnimation extends StatelessWidget {
  final String transform;
  final Widget child;
  final double tweenBegin;
  final double tweenEnd;

  const TweenAnimation({
    Key? key,
    required this.transform,
    required this.child,
    required this.tweenBegin,
    required this.tweenEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: const Interval(
        0,
        1,
        curve: Curves.bounceOut,
      ),
      tween: Tween<double>(begin: tweenBegin, end: tweenEnd),
      duration: const Duration(seconds: 2),
      builder: (BuildContext context, double myValue, _) {
        if (transform == 'Transform.rotate') {
          return Transform.rotate(
            angle: myValue,
            child: child,
          );
        } else if (transform == 'Transform.scale') {
          return Transform.scale(
            scale: myValue,
            child: child,
          );
        } else if (transform == 'Transform.translate') {
          return Transform.translate(
            offset: Offset(myValue, 0),
            child: child,
          );
        } else {
          return const Text('this widget is not avaliable for this block');
        }
      },
    );
  }
}
