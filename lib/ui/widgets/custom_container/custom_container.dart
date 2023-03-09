import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  Widget? child;
  Color? color1;
  Color? color2;
  Color? color3;
  AlignmentGeometry? begin;
  AlignmentGeometry? end;
  double? height;
  double? width;
  EdgeInsetsGeometry? margin;

  CustomContainer({
    Key? key,
    this.child,
    this.color1,
    this.color2,
    this.color3,
    this.begin,
    this.end,
    this.height,
    this.width,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Container(
      
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[color1!, color2!], begin: begin!, end: end!)),
      margin: margin,
      child: child,
    );
  }
}
