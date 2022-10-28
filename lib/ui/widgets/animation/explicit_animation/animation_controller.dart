import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/animation/explicit_animation/explicit_animation.dart';

class MyAnimationController extends StatefulWidget {
  final Curve curve;
  final double tweenBegin;
  final double tweenEnd;
  final int duration;
  final Widget child;
 const MyAnimationController(
      {Key? key,
      required this.curve,
      required this.tweenBegin,
      required this.tweenEnd,
      required this.duration, required this.child})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MyAnimationController> createState() => _MyAnimationControllerState(
      curve: curve, tweenBegin: tweenBegin, tweenEnd: tweenEnd, duration: duration,child: child);
}

class _MyAnimationControllerState extends State<MyAnimationController>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Curve curve;
  final double tweenBegin;
  final double tweenEnd;
  final int duration;
  final Widget child;

  _MyAnimationControllerState(
      {required this.duration,
      required this.tweenBegin,
      required this.tweenEnd,
      required this.curve,
      required this.child});

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: duration),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(parent: _animationController, curve: curve);
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      ExplicitAnimation(animation: _animation, tweenBegin: tweenBegin,tweenEnd: tweenEnd,child: child,);
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
