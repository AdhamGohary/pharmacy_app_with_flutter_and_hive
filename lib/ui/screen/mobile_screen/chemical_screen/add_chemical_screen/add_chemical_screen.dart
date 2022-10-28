import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
import 'package:pharmacy_app/ui/screen/mobile_screen/chemical_screen/component/custom_column/custom_column.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/functions/chemical_functions/chemical_functions.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';

class AddChemicalScreen extends StatefulWidget {
  const AddChemicalScreen({Key? key}) : super(key: key);

  @override
  State<AddChemicalScreen> createState() => _AddChemicalScreenState();
}

class _AddChemicalScreenState extends State<AddChemicalScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController expireController = TextEditingController();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> amountKey = GlobalKey<FormState>();
  GlobalKey<FormState> priceKey = GlobalKey<FormState>();
  GlobalKey<FormState> expireKey = GlobalKey<FormState>();
  Box myBox = Hive.box<ChemicalModel>('chemicalinfo');
  String expire = null.toString();

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    priceController.dispose();
    expireController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: CustomTxt(
            txt: 'Chemical',
            txtStyle: style1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.tealAccent,
          onPressed: () {
            ChemiclaFunctions.addChemical(
              context: context,
              amountKey: amountKey,
              expire: expire,
              priceKey: priceKey,
              nameKey: nameKey,
              myBox: myBox,
              nameController: nameController,
              amountController: amountController,
              priceController: priceController,
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 0.1 * getHeight(context: context)),
          child: CustomColumn(
            amountController: amountController,
            amountKey: amountKey,
            nameController: nameController,
            nameKey: nameKey,
            priceController: priceController,
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
        ));
  }
}
