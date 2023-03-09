import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
import 'package:pharmacy_app/model/product_model/product_model.dart';
import 'package:pharmacy_app/model/sign_up_model/sign_up_model.dart';
import 'package:pharmacy_app/responsive/responsive.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/chemical_screen/edit_chemical_screen/edit_chemical_screen.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/main_screen/main_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/login_screen/login_screen.dart';
import 'package:pharmacy_app/view-model/product_view_model/product_view_model.dart';
import 'package:pharmacy_app/view-model/sign_up_model/sign_up_model.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(ChemicalModelAdapter());
  await Hive.openBox<ChemicalModel>('chemicalinfo');
  Hive.registerAdapter(SignUpModelAdapter());
  await Hive.openBox<SignUpModel>('userInfoAuth');
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('productinfo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductViewModel>(create: (context) => ProductViewModel()),
        Provider<SignUpViewModel>(create: (context) => SignUpViewModel()),
      ],
      child: MaterialApp(
        routes: {
          'MainScreen': (context) => const MainScreen(),
          'EditChemicalScreen': (context) => const EditChemicalScreen(),
          'LoginScreen': (context) => const LoginScreen(),
        },
        home: const Responsive(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
