import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Color backGroundColor;
  final Widget widget;
  final double width;
  const CustomDrawer(
      {Key? key,
      required this.backGroundColor,
      required this.widget,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backGroundColor,
      width: width,
      child: widget,
    );
  }
}
