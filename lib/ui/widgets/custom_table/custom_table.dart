import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';


class CustomTable extends StatefulWidget {
  final int index;
  const CustomTable({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  late Box myBox;
  @override
  void initState() {
    myBox = Hive.box<ChemicalModel>('chemicalinfo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          CustomTxt(
            txt: myBox.getAt(widget.index).nameOfChemical,
            txtStyle: style4,
          ),
          CustomTxt(
              txt: '${myBox.getAt(widget.index).kiloOfChemical}',
              txtStyle: style4),
          CustomTxt(
              txt: '${myBox.getAt(widget.index).priceOfKiloOfChemical}',
              txtStyle: style4),
          CustomTxt(
              txt: '${myBox.getAt(widget.index).expireDateOfChemical}',
              txtStyle: style4),
          CustomTxt(
              txt: '${myBox.getAt(widget.index).gramsOfChemical}',
              txtStyle: style4),
          CustomTxt(
              txt: '${myBox.getAt(widget.index).priceOfgramsOfChemical}',
              txtStyle: style4),
        ])
      ],
    );
  }
}
