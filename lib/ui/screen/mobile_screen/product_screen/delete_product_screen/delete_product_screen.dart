import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/product_functions/product_functions.dart';

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
      backgroundColor: Colors.green,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.1 * height),
          child: AppBar(
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            title: CustomTxt(txt: 'Delete Product', txtStyle: style1),
          )),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.05 * height, bottom: 0.05 * height),
            child: CustomTxtFormField(
              hintText: 'Name Of Product',
              textEditingController: deletedProductController,
              obScure: false,
              regExpSource: '',
              autovalidateMode: AutovalidateMode.disabled,
              caseSensitive: false,
              keyBoardType: TextInputType.name,
            ),
          ),
          CustomBtn(
              function: () {
                ProductFunctions.deleteProduct(
                    context: context,
                    deletedProductController: deletedProductController);
              },
              color: Colors.transparent,
              txt: 'Delete',
              textStyle: style4,
              height: 0.05 * height,
              width: 0.05 * width)
        ],
      ),
    );
  }
}
