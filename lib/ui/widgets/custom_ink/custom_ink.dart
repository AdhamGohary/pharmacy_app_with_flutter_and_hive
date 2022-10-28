import 'package:flutter/material.dart';

class CustomInk extends StatelessWidget {
  final Widget child;
  final void Function() function;
  const CustomInk({Key? key, required this.child, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      highlightColor: Colors.teal,
      borderRadius: BorderRadius.circular(0.5 * width),
      child: child,
    );
  }
}
