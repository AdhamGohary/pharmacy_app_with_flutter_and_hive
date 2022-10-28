import 'package:flutter/cupertino.dart';

class ExplicitAnimation extends AnimatedWidget {
  final double tweenBegin;
  final double tweenEnd;
  final Widget child;

  const ExplicitAnimation(
      {super.key, required this.tweenBegin,
      required this.tweenEnd,
      required this.child,
      required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final obacityTween = Tween<double>(
      begin: tweenBegin,
      end: tweenEnd,
    );
    // final obicitySize = Tween<double>(begin: tweenBegin, end: tweenEnd);
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: obacityTween.evaluate(animation),
      child: child,
    );
  }
}
