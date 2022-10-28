import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/screen/web_or_desktop_screen/component/back_ground_container.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/product_functions/product_functions.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class DeleteProductScreen extends StatefulWidget {
  const DeleteProductScreen({Key? key}) : super(key: key);

  @override
  State<DeleteProductScreen> createState() => _DeleteProductScreenState();
}

class _DeleteProductScreenState extends State<DeleteProductScreen> {
  TextEditingController deletedProductController = TextEditingController();

  @override
  void dispose() {
    deletedProductController.dispose();
    super.dispose();
  }

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
            title:const CustomTxt(txt: 'Delete Product', txtStyle: TextStyle(color: Colors.white)),
          )),
      body: Stack(
        children: [
          const BackGroundContainr(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:0.6 * getHeight(context: context)),
            child: ListView(
              padding: EdgeInsets.only(top: 0.3*getHeight(context: context)),
              children: [
                CustomTxtFormField(
                  hintText: 'Name Of Product',
                  textEditingController: deletedProductController,
                  obScure: false,
                  regExpSource: '',
                  autovalidateMode: AutovalidateMode.disabled,
                  caseSensitive: false,
                  keyBoardType: TextInputType.name,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: .03 * getHeight(context: context)),
                  child: CustomBtn(
                      function: () {
                        ProductFunctions.deleteProduct(
                            context: context,
                            deletedProductController: deletedProductController);
                      },
                      color: Colors.transparent,
                      txt: 'Delete',
                      textStyle: style4,
                      height: 0.05 * height,
                      width: 0.05 * width),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
