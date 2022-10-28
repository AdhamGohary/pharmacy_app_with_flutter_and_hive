import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/chemical_screen/edit_chemical_screen/edit_chemical_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/chemical_screen/add_chemical_screen/add_chemical_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/chemical_screen/delete_chemical_screen/delete_chemical_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/chemical_screen/view_chemical_screen/view_chemical_screen.dart';
import 'package:pharmacy_app/ui/widgets/animation/explicit_animation/animation_controller.dart';
import 'package:pharmacy_app/ui/widgets/animation/tween_animation/tween_animation.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class ChemicalScreen extends StatelessWidget {
  const ChemicalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.1 * height),
          child: AppBar(
            backgroundColor: Colors.lightBlue[100],
            centerTitle: true,
            title:const Hero(
                tag: 'chemical',
                child: Text( 'chemical', style: TextStyle(color: Colors.white))),
          )),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, children: [
        Hero(
            tag: 'chemicalImage',
            child: MyAnimationController(
              curve: Curves.easeInCirc,
              duration: 4000,
              tweenBegin: 0.2,
              tweenEnd: 1,
              child: Image.asset(
                'images/chemical.jpeg',
                fit: BoxFit.fill,
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:0.6 * height),
          child: ListView(
            padding: EdgeInsets.only(top: 0.3*getHeight(context: context)),
            children: [
              TweenAnimation(
                transform: 'Transform.translate',
                tweenBegin: -0.9 * width,
                tweenEnd: 0.01 * width,
                child: CustomBtn(
                  color: const Color.fromARGB(255, 178, 206, 237),
                  txt: 'Add Chemical',
                  textStyle: style1,
                  height: 0.1 * height,
                  width: 0.7 * width,
                  function: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (builder) {
                      return const AddChemicalScreen();
                    }));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 0.05 * height, top: 0.05 * height),
                child: TweenAnimation(
                  transform: 'Transform.translate',
                  tweenBegin: 0.9 * width,
                  tweenEnd: 0.01 * width,
                  child: CustomBtn(
                    color: Colors.lightBlue,
                    txt: 'Edit Chemical',
                    textStyle: style1,
                    height: 0.1 * height,
                    width: 0.8 * width,
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditChemicalScreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0.05 * height),
                child: TweenAnimation(
                  transform: 'Transform.translate',
                  tweenBegin: -0.9 * width,
                  tweenEnd: 0.01 * width,
                  child: CustomBtn(
                    color: const Color.fromARGB(255, 140, 222, 251),
                    txt: 'Show Chemical',
                    textStyle: style1,
                    height: 0.1 * height,
                    function: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ViewChemicalScreen();
                      }));
                    },
                    width: 0.7 * width,
                  ),
                ),
              ),
              TweenAnimation(
                transform: 'Transform.translate',
                tweenBegin: 0.9 * width,
                tweenEnd: 0.01 * width,
                child: CustomBtn(
                  color:const Color.fromARGB(255,105, 238, 240),
                  txt: 'Delete Chemical',
                  textStyle: style1,
                  height: 0.1 * height,
                  function: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const DeleteChemicalScreen();
                    }));
                  },
                  width: 0.7 * width,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
