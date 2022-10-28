import 'package:flutter/material.dart';

class CustomTxt extends StatelessWidget {
  final String txt;
  final TextStyle txtStyle;
  const CustomTxt({Key? key, required this.txt, required this.txtStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: txtStyle,
    );
  }
}
