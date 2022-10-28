import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';

// ignore: must_be_immutable
class CustomColumnWithTwoTxtForm extends StatefulWidget {
  final int index;
  final String hintText1;
  final String hintText2;
  final String ifBody1;
  final String ifBody2;
  final String regExpSource1;
  final String regExpSource;
  final TextEditingController chemicalController;
  void Function()? function;
  TextEditingController ?amountController;
  GlobalKey<FormState>?amountKey;
  final GlobalKey<FormState> newNameProductKey;
  final String titleTxt;
   CustomColumnWithTwoTxtForm({
    Key? key,
    this.amountController,
    this.amountKey,
    required this.index,
    required this.hintText1,
    required this.hintText2,
    required this.ifBody1,
    required this.regExpSource,
    required this.chemicalController,
    required this.titleTxt,
    required this.regExpSource1,
    required this.newNameProductKey,
    required this.ifBody2,
    this.function,
  }) : super(key: key);

  @override
  State<CustomColumnWithTwoTxtForm> createState() =>
      _CustomColumnWithTwoTxtFormState();
}

class _CustomColumnWithTwoTxtFormState
    extends State<CustomColumnWithTwoTxtForm> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      CustomTxt(txt: ' ${widget.titleTxt}${widget.index}', txtStyle: style1),
      Padding(
        padding: EdgeInsets.only(top: 0.03 * height, bottom: 0.01 * height),
        child: CustomTxtFormField(
          obScure: false,
          regExpSource: widget.regExpSource1,
          hintText: widget.hintText1,
          textEditingController: widget.chemicalController,
          autovalidateMode: AutovalidateMode.disabled,
          caseSensitive: false,
          keyBoardType: TextInputType.name,
          myKey: widget.newNameProductKey,
          ifBody: widget.ifBody2,
        ),
      ),
      CustomTxtFormField(
        obScure: false,
        regExpSource: widget.regExpSource,
        ifBody: widget.ifBody1,
        hintText: widget.hintText2,
        textEditingController: widget.amountController,
        myKey: widget.amountKey,
        autovalidateMode: AutovalidateMode.disabled,
        caseSensitive: false,
        keyBoardType: TextInputType.datetime,
        function: widget.function
      ),
    ]);
  }
}
