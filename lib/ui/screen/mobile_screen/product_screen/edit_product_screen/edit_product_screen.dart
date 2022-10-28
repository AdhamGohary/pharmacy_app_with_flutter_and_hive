import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/product_screen/component/custom_column_with_two_txtform/custom_column_with_two_txtform.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/const_widget_functins/const_widget_functions.dart';
import 'package:pharmacy_app/utilits/functions/product_functions/product_functions.dart';
import 'package:pharmacy_app/view-model/product_view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class EditProducScreen extends StatefulWidget {
  const EditProducScreen({Key? key}) : super(key: key);

  @override
  State<EditProducScreen> createState() => _EditProducScreenState();
}

class _EditProducScreenState extends State<EditProducScreen> {
  TextEditingController nameProductController = TextEditingController();
  TextEditingController newNameProductController = TextEditingController();
  TextEditingController priceOfProductController = TextEditingController();
  GlobalKey<FormState> priceOfProductKey = GlobalKey<FormState>();
  GlobalKey<FormState> newNameProductKey = GlobalKey<FormState>();
  bool isEdit = false;
  String expire = null.toString();

  @override
  void dispose() {
    nameProductController.dispose();
    newNameProductController.dispose();
    priceOfProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            ProductFunctions.editProduct(
                context: context,
                priceOfProductKey: priceOfProductKey,
                newNameProductKey: newNameProductKey,
                nameProductController: nameProductController,
                newNameProductController: newNameProductController,
                priceOfProductController: priceOfProductController,
                expire: expire);
          },
          child: const Icon(Icons.edit)),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.1 * height),
          child: AppBar(
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            title: CustomTxt(txt: 'Edit Producct', txtStyle: style1),
          )),
      backgroundColor: Colors.green,
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: EdgeInsets.only(top: 0.02 * height),
          child: CustomTxtFormField(
            obScure: false,
            regExpSource: '',
            hintText: 'Name Of Product',
            textEditingController: nameProductController,
            autovalidateMode: AutovalidateMode.disabled,
            caseSensitive: false,
            keyBoardType: TextInputType.name,
          ),
        ),
        CustomBtn(
          color: Colors.transparent,
          txt: 'edit product',
          textStyle: style4,
          height: 0.05 * height,
          function: () {
            if (Provider.of<ProductViewModel>(context, listen: false)
                .myBox1
                .containsKey(nameProductController.text.toUpperCase().trim())) {
              setState(() {
                isEdit = !isEdit;
              });
            } else {
              showAwsomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  title: 'Error',
                  desc: 'This product do not exist');
            }
          },
          width: 0.01 * width,
        ),
        isEdit == true
            ? SizedBox(
                width: 0.5 * width,
                height: 0.5 * height,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: 0.2 * width,
                      height: 0.31 * height,
                      child: CustomColumnWithTwoTxtForm(
                        chemicalController: newNameProductController,
                        hintText1: 'New Name Of Product',
                        ifBody1: 'please enter expire date in form 25/5/2025',
                        hintText2: 'Expire Date',
                        index: 1,
                        regExpSource: '',
                        titleTxt: 'Product',
                        regExpSource1:
                            r'\w|\d|\s|[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FF]',
                        newNameProductKey: newNameProductKey,
                        ifBody2: 'Please enter new name of product',
                        function: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2100))
                              .then((value) {
                            setState(() {
                              expire = value.toString();
                            });
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.01 * height),
                      child: CustomTxtFormField(
                        obScure: false,
                        regExpSource: r'^[+]?([.]\d+|\d+([.]\d+)?)$',
                        autovalidateMode: AutovalidateMode.disabled,
                        textEditingController: priceOfProductController,
                        myKey: priceOfProductKey,
                        hintText: 'Price Of Product',
                        caseSensitive: false,
                        keyBoardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 0.05 * height,
                width: 0.05 * width,
              ),
      ]),
    );
  }
}
