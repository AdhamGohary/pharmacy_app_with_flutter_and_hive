import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class InformationAboutApp extends StatelessWidget {
  const InformationAboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: CustomTxt(txt: 'About App', txtStyle: style1),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 0.1 * getHeight(context: context),
                left: 0.05 * getwidth(context: context)),
            child: SizedBox(
              child: Center(
                child: CustomTxt(
                  txt:
                      '1- The idea of ​​this application is that it stores \n the names, quantities, prices and expiry date \n of the chemicals purchased by the pharmacist\n \n 2- The second part of the program: When the\n     pharmacist creates a product from the chemicals\n    stored previously, the pharmacist must enter the  chemicals\n  and their quantities used in this product\n , and then the program automatically displays the\n  name of the product in a separate screen and \n displays the materials included in the \n installation of this product and displays their quantities\n  And the cost of each quantity separately \n to know the most consumed materials in this\n product and  then finally display the price of the product',
                  txtStyle: style4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
