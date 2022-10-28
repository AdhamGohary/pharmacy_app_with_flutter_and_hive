import 'package:flutter/material.dart';

import 'package:pharmacy_app/ui/screen/mobile_screen/login_screen/login_screen.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreen()
    );
  }
}