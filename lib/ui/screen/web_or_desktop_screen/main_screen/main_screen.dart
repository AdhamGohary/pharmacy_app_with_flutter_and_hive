import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/chemical_screen/chemical_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/information_about_app/information_about_app.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/product_screen/product_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/login_screen/login_screen.dart';
import 'package:pharmacy_app/ui/widgets/animation/hero_animation/hero_animation.dart';
import 'package:pharmacy_app/ui/widgets/animation/tween_animation/tween_animation.dart';
import 'package:pharmacy_app/ui/widgets/custom_drawer/custom_drawer.dart';
import 'package:pharmacy_app/ui/widgets/custom_ink/custom_ink.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
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
          backGroundColor: Colors.lightBlue,
          widget: ListView(
            children: [
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
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }), (route) => false),
                child: ListTile(
                  title: CustomTxt(txt: 'Log Out', txtStyle: style4),
                  trailing: const Icon(Icons.logout),
                ),
              )
            ],
          ),
          width: 0.5 * getwidth(context: context)),
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        centerTitle: true,
        title: CustomTxt(txt: '', txtStyle: style1),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.1 * getHeight(context: context)),
            child: Center(
                child: Selector<SignUpViewModel, String>(
                    builder: (context, val, _) {
                      return CustomTxt(
                        txt: val,
                        txtStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 0.03 * getwidth(context: context)),
                      );
                    },
                    selector: (context, signUpViewModel) =>
                        signUpViewModel.nameOfPharmacy)),
          ),
          
          Container(
            width: getwidth(context: context),
            height: getHeight(context: context),
            margin: EdgeInsets.only(top: 0.2 * getHeight(context: context)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(0.05 * getHeight(context: context)),
                    topRight:
                        Radius.circular(0.05 * getHeight(context: context)))),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  TweenAnimation(
                    transform: 'Transform.translate',
                    tweenBegin: -getwidth(context: context),
                    tweenEnd: 0.3 * getwidth(context: context),
                    child: CustomInk(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.2 * getHeight(context: context),
                              width: 0.2 * getHeight(context: context),
                              child: HeroAnimation(
                                  tag: 'chemicalImage',
                                  heroChild:
                                      Image.asset('images/chemical.jpeg')),
                            ),
                            Center(
                              child:
                                  CustomTxt(txt: 'Chemical', txtStyle: style1),
                            )
                          ],
                        ),
                        function: () =>
                            Navigator.of(context).push(PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 1000),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: const ChemicalScreen(),
                                );
                              },
                            ))),
                  ),
                  TweenAnimation(
                      transform: 'Transform.translate',
                      tweenBegin: getwidth(context: context),
                      tweenEnd: 0.5 * getwidth(context: context),
                      child: CustomInk(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.2 * getHeight(context: context),
                              width: 0.2 * getHeight(context: context),
                              child: HeroAnimation(
                                  tag: 'productsImage',
                                  heroChild:
                                      Image.asset('images/products.jpg')),
                            ),
                            Center(
                              child:
                                  CustomTxt(txt: 'Product', txtStyle: style1),
                            )
                          ],
                        ),
                        function: () =>
                            Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration:
                              const Duration(milliseconds: 1000),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: const ProductScreen(),
                            );
                          },
                        )),
                      )),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
