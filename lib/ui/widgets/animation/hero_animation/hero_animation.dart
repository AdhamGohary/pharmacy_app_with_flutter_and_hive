import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  final String tag;
  final Widget heroChild;
  const HeroAnimation({Key? key, required this.tag, required this.heroChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: heroChild,
    );
  }
}
