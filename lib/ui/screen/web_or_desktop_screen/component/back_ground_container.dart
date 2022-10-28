import 'package:flutter/material.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';
import '../../../widgets/custom_container/custom_container.dart';

class BackGroundContainr extends StatelessWidget {
  const BackGroundContainr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
              width: getwidth(context: context),
              height: getHeight(context: context),
              color1: Colors.lightBlue[100],
              color2: Colors.white,
              color3: Colors.lightBlue[100],
              begin:Alignment.topCenter ,
              end: Alignment.bottomCenter,
            );
  }
}