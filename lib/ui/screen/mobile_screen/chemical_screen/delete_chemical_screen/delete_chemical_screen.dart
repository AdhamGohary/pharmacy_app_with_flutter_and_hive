import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/chemical_functions/chemical_functions.dart';

class DeleteChemicalScreen extends StatefulWidget {
  const DeleteChemicalScreen({Key? key}) : super(key: key);

  @override
  State<DeleteChemicalScreen> createState() => _DeleteChemicalScreenState();
}

class _DeleteChemicalScreenState extends State<DeleteChemicalScreen> {
  TextEditingController nameController = TextEditingController();
  Box myBox = Hive.box<ChemicalModel>('chemicalinfo');

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.07 * height),
        child: AppBar(
          centerTitle: true,
          title: CustomTxt(txt: 'Delete Chemical', txtStyle: style1),
          backgroundColor: Colors.green,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.08 * height),
        child: Center(
          child: Column(
            children: [
              CustomTxtFormField(
                hintText: 'Name of Chemical',
                obScure: false,
                maxLines: 1,
                ifBody: '',
                regExpSource: '',
                textEditingController: nameController,
                autovalidateMode: AutovalidateMode.disabled,
                caseSensitive: false,
                keyBoardType: TextInputType.name,
              ),
              CustomBtn(
                  color: Colors.transparent,
                  txt: 'Delete',
                  textStyle: style4,
                  height: 0.05 * height,
                  function: () {
                    ChemiclaFunctions.deleteChemical(
                        myBox: myBox,
                        nameController: nameController,
                        context: context);
                  },
                  width: 0.8 * width)
            ],
          ),
        ),
      ),
    );
  }
}
