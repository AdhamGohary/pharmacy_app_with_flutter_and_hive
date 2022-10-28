import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/mobile_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/web_or_desktop_screen.dart';

class Responsive extends StatelessWidget {
  const Responsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (buildContext,constraints){
      if (constraints.maxWidth>=850) {
        return const WebOrDesktopScreen();
      }
      else{
        return const MobileScreen();
      }
      
    });
  }
}