import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCircleAvatar extends StatelessWidget {
  ImageProvider<Object>? backgroundImage;
  final double maxRadius;
  Widget?child;
  
   MyCircleAvatar({Key? key, this.backgroundImage, required this.maxRadius,this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: backgroundImage,
      maxRadius: maxRadius,
      backgroundColor: Colors.transparent,
      child: child,
     
    );
  }
}
