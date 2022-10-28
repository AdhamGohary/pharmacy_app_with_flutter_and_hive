import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
import 'package:pharmacy_app/ui/widgets/custom_btn/custom_btn.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/chemical_screen/component/custom_column/custom_column.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt_form_field/custom_txt_form_field.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/chemical_functions/chemical_functions.dart';
import 'package:pharmacy_app/utilits/functions/const_functions/const_functions.dart';
import 'package:pharmacy_app/utilits/functions/const_widget_functins/const_widget_functions.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class EditChemicalScreen extends StatefulWidget {
  const EditChemicalScreen({Key? key}) : super(key: key);

  @override
  State<EditChemicalScreen> createState() => _EditChemicalScreenState();
}

class _EditChemicalScreenState extends State<EditChemicalScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> amountKey = GlobalKey<FormState>();
  GlobalKey<FormState> priceKey = GlobalKey<FormState>();
  bool isEdit = false;
  Box myBox = Hive.box<ChemicalModel>('chemicalinfo');
  String expire = null.toString();
  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    priceController.dispose();
    editNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.06 * getHeight(context: context)),
        child: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: CustomTxt(txt: 'Edit Chemical', txtStyle: style1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            ChemiclaFunctions.edit(
              context: context,
              expire: expire,
              amountKey: amountKey,
              priceKey: priceKey,
              nameController: nameController,
              editNameController: editNameController,
              amountController: amountController,
              priceController: priceController,
            );
          },
          child: const Icon(Icons.edit)),
      body: Padding(
          padding: EdgeInsets.only(top: 0.04 * getHeight(context: context)),
          child: ListView(shrinkWrap: true, children: [
            CustomTxtFormField(
              hintText: 'Name Of Chemical',
              obScure: false,
              maxLines: 1,
              ifBody: 'please enter name',
              regExpSource: '',
              textEditingController: nameController,
              autovalidateMode: AutovalidateMode.disabled,
              caseSensitive: false,
              keyBoardType: TextInputType.name,
            ),
            CustomBtn(
                color: Colors.transparent,
                txt: 'edit',
                textStyle: style4,
                height: 0.05 * getHeight(context: context),
                function: () async {
                  if (myBox.keys
                      .contains(nameController.text.toUpperCase().trim())) {
                    setState(() {
                      isEdit = !isEdit;
                      checkDebugMode(true);
                    });
                  } else {
                    showAwsomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        title: 'Error',
                        desc: 'This chemical do not exist');
                  }
                },
                width: 0.01 * getwidth(context: context)),
            isEdit == true
                ? SizedBox(
                    height: 0.8 * getHeight(context: context),
                    child: CustomColumn(
                      nameController: editNameController,
                      amountController: amountController,
                      priceController: priceController,
                      nameKey: nameKey,
                      amountKey: amountKey,
                      priceKey: priceKey,
                      function: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2100))
                          .then((value) {
                        setState(() {
                          expire = value.toString();
                        });
                      }),
                    ),
                  )
                : SizedBox(
                    height: getHeight(context: context),
                    width: getwidth(context: context),
                  ),
          ])),
    );
  }
}
