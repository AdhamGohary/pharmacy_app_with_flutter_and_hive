import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';

// ignore: must_be_immutable
class CustomColumn extends StatelessWidget {
  final TextEditingController nameController;

  final TextEditingController amountController;

  final TextEditingController priceController;

  final GlobalKey<FormState> nameKey;

  final GlobalKey<FormState> amountKey;

  final GlobalKey<FormState> priceKey;

  void Function()? function;
  CustomColumn(
      {Key? key,
      required this.nameController,
      required this.amountController,
      required this.priceController,
      required this.nameKey,
      required this.amountKey,
      required this.priceKey,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 0.01 * height),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 0.02 * height),
            child: CustomTxtFormField(
              hintText: 'Name',
              obScure: false,
              textEditingController: nameController,
              regExpSource:
                  r'\w|\d(\s|\S)|[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FF]',
              ifBody: 'Please enter name of chemical',
              maxLines: 1,
              myKey: nameKey,
              autovalidateMode: AutovalidateMode.disabled,
              caseSensitive: false,
              keyBoardType: TextInputType.name,
            ),
          ),
          CustomTxtFormField(
            hintText: 'Amount(Kilo):10.0',
            obScure: false,
            regExpSource: r'^[+]?([.]\d+|\d+([.]\d+)?)$',
            textEditingController: amountController,
            ifBody: 'amount should be in kilo',
            maxLines: 1,
            myKey: amountKey,
            autovalidateMode: AutovalidateMode.disabled,
            caseSensitive: true,
            keyBoardType: TextInputType.number,
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.02 * height, bottom: 0.02 * height),
            child: CustomTxtFormField(
              hintText: 'Price of kilo(Pounds):10.0',
              obScure: false,
              regExpSource: r'^[+]?([.]\d+|\d+([.]\d+)?)$',
              ifBody: 'Please enter price in pounds',
              textEditingController: priceController,
              maxLines: 1,
              myKey: priceKey,
              autovalidateMode: AutovalidateMode.disabled,
              caseSensitive: true,
              keyBoardType: TextInputType.number,
            ),
          ),
          CustomTxtFormField(
              hintText: 'Expire date ',
              obScure: false,
              ifBody: '2023/8/25',
              regExpSource: '',
              maxLines: 1,
              autovalidateMode: AutovalidateMode.disabled,
              caseSensitive: true,
              keyBoardType: TextInputType.datetime,
              function: function),
        ],
      ),
    );
  }
}
