import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/product_screen/add_product_screen/add_product_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/product_screen/delete_product_screen/delete_product_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/product_screen/edit_product_screen/edit_product_screen.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/product_screen/view_product_screen/view_product_screen.dart';
import 'package:pharmacy_app/ui/widgets/animation/explicit_animation/animation_controller.dart';
import 'package:pharmacy_app/ui/widgets/animation/tween_animation/tween_animation.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.1 * height),
          child: AppBar(
            centerTitle: true,
            title:const Text('Product',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.lightBlue[100],
          )),
      body: Stack(fit: StackFit.expand, children: [
        Hero(
            tag: 'productsImage',
            child: MyAnimationController(
              curve: Curves.easeInCirc,
              duration: 4000,
              tweenBegin: 0.2,
              tweenEnd: 1,
              child: Image.asset(
                'images/products.jpg',
                fit: BoxFit.fill,
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:0.6* height),
          child: ListView(
            padding: EdgeInsets.only(top: 0.3*getHeight(context: context)),
            children: [
              TweenAnimation(
                transform: 'Transform.translate',
                tweenBegin: -0.9 * width,
                tweenEnd: 0.01 * width,
                child: CustomBtn(
                  color: const Color.fromARGB(255, 178, 206, 237),
                  txt: 'Add product',
                  textStyle: style1,
                  height: 0.1 * height,
                  function: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddProductScreen()));
                  },
                  width: 0.7 * width,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 0.05 * height, top: 0.05 * height),
                child: TweenAnimation(
                  transform: 'Transform.translate',
                  tweenBegin: 0.9 * width,
                  tweenEnd: 0.01 * width,
                  child: CustomBtn(
                    color: Colors.lightBlue,
                    txt: 'Edit product',
                    textStyle: style1,
                    height: 0.1 * height,
                    function: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const EditProducScreen();
                      }));
                    },
                    width: 0.7 * width,
                  ),
                ),
              ),
              TweenAnimation(
                transform: 'Transform.translate',
                tweenBegin: -0.9 * width,
                tweenEnd: 0.01 * width,
                child: CustomBtn(
                  color: const Color.fromARGB(255, 140, 222, 251),
                  txt: 'Show product',
                  textStyle: style1,
                  height: 0.1 * height,
                  function: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ViewProductScreen();
                    }));
                  },
                  width: 0.7 * width,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.05 * height),
                child: TweenAnimation(
                  transform: 'Transform.translate',
                  tweenBegin: 0.9 * width,
                  tweenEnd: 0.01 * width,
                  child: CustomBtn(
                    color: const Color.fromARGB(255,105, 238, 240),
                    txt: 'Delete product',
                    textStyle: style1,
                    height: 0.1 * height,
                    function: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DeleteProductScreen();
                      }));
                    },
                    width: 0.7 * width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
