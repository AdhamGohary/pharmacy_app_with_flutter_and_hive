import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  const CustomDivider({Key? key, required this.height, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: color,
    );
  }
}
