import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/chemical_screen/chemical_screen.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/information_about_app/information_about_app.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/login_screen/login_screen.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/product_screen/product_screen.dart';
import 'package:pharmacy_app/ui/widgets/animation/tween_animation/tween_animation.dart';
import 'package:pharmacy_app/ui/widgets/custom_container/custom_container.dart';
import 'package:pharmacy_app/ui/widgets/custom_drawer/custom_drawer.dart';
import 'package:pharmacy_app/ui/widgets/custom_ink/custom_ink.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/constants/strings.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';
import 'package:pharmacy_app/view-model/sign_up_model/sign_up_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController co = TextEditingController();
  GlobalKey<FormState> gk = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
          backGroundColor: Colors.lightGreen,
          widget: ListView(
            children: [
              Center(
                  child: Selector<SignUpViewModel, String>(
                      builder: (context, val, _) {
                        return CustomTxt(
                          txt: val,
                          txtStyle: style4,
                        );
                      },
                      selector: (context, signUpViewModel) =>
                          signUpViewModel.nameOfPharmacy)),
              Padding(
                padding:
                    EdgeInsets.only(top: 0.05 * getHeight(context: context)),
                child: InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const InformationAboutApp();
                  })),
                  child: ListTile(
                    title: CustomTxt(
                      txt: 'About Application',
                      txtStyle: style4,
                    ),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen())),
                child: ListTile(
                  title: CustomTxt(txt: 'Log Out', txtStyle: style4),
                  trailing: const Icon(Icons.logout),
                ),
              )
            ],
          ),
          width: 0.5 * getwidth(context: context)),
      backgroundColor: const Color.fromARGB(166, 0, 250, 8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1 * getHeight(context: context)),
        child: AppBar(
          centerTitle: true,
          title: CustomTxt(txt: nameOfApp, txtStyle: style1),
          backgroundColor: const Color.fromARGB(255, 77, 255, 145),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              TweenAnimation(
                transform: 'Transform.translate',
                tweenBegin: -0.5 * getwidth(context: context),
                tweenEnd: -.03 * getwidth(context: context),
                child: CustomInk(
                  function: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 2000),
                        pageBuilder:
                            (((context, animation, secondaryAnimation) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: const ChemicalScreen(),
                                )))));
                  },
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.03 * getHeight(context: context),
                          bottom: 0.02 * getHeight(context: context)),
                      child: Hero(
                          tag: 'chemical',
                          child: CustomTxt(txt: 'Chemical', txtStyle: style1)),
                    ),
                    CustomContainer(
                        width: 0.5 * getwidth(context: context),
                        height: 0.83 * getHeight(context: context),
                        color1: Colors.green,
                        color2: Colors.lightGreen,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        child: Hero(
                          tag: 'chemicalImage',
                          child: Image.asset(
                            'images/chemical.jpeg',
                            fit: BoxFit.fill,
                          ),
                        )),
                  ]),
                ),
              ),
              TweenAnimation(
                transform: 'Transform.translate',
                tweenBegin: 0.5 * getwidth(context: context),
                tweenEnd: .004 * getwidth(context: context),
                child: CustomInk(
                  function: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 2000),
                        pageBuilder:
                            ((context, animation, secondaryAnimation) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: const ProductScreen(),
                                ))));
                  },
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.03 * getHeight(context: context),
                          bottom: 0.02 * getHeight(context: context)),
                      child: Hero(
                          tag: 'product',
                          child: CustomTxt(txt: 'Products', txtStyle: style1)),
                    ),
                    CustomContainer(
                        width: 0.5 * getwidth(context: context),
                        height: 0.83 * getHeight(context: context),
                        color1: Colors.green,
                        color2: Colors.lightGreen,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        child: Image.asset(
                          'images/products.jpg',
                          fit: BoxFit.fill,
                        )),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
