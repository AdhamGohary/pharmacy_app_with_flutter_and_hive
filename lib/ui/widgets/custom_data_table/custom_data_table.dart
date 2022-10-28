import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';


class CustomDataTable extends StatefulWidget {
  final int index;
  final List filteredList;

  const CustomDataTable(
      {Key? key, required this.index, required this.filteredList})
      : super(key: key);

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: const MaterialStatePropertyAll(Color.fromARGB(255,105, 238, 240)),
      border: TableBorder.all(color: Colors.white),
      showBottomBorder: true,
      columns: <DataColumn>[
        DataColumn(
            label:
                CustomTxt(txt: 'nameOfChemical', txtStyle: style4)),
        DataColumn(
            label:
                CustomTxt(txt: 'kiloOfChemical', txtStyle: style4)),
        DataColumn(
            label: CustomTxt(
                txt: 'priceOfKiloOfChemical', txtStyle: style4)),
        DataColumn(
            label: CustomTxt(
                txt: 'expireDateOfChemical', txtStyle: style4)),
        DataColumn(
            label:
                CustomTxt(txt: 'gramsOfChemical', txtStyle: style4)),
        DataColumn(
            label: CustomTxt(
                txt: 'priceOfgramsOfChemical', txtStyle: style4)),
      ],
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(
            CustomTxt(
              txt: widget.filteredList[widget.index].nameOfChemical,
              txtStyle: style4,
            ),
          ),
          DataCell(
            CustomTxt(
                txt: '${widget.filteredList[widget.index].kiloOfChemical}',
                txtStyle: style4),
          ),
          DataCell(
            CustomTxt(
                txt:
                    '${widget.filteredList[widget.index].priceOfKiloOfChemical}',
                txtStyle: style4),
          ),
          DataCell(
            CustomTxt(
                txt: widget.filteredList[widget.index].expireDateOfChemical,
                txtStyle: style4),
          ),
          DataCell(
            CustomTxt(
                txt: '${widget.filteredList[widget.index].gramsOfChemical}',
                txtStyle: style4),
          ),
          DataCell(
            CustomTxt(
                txt:
                    '${widget.filteredList[widget.index].priceOfgramsOfChemical}',
                txtStyle: style4),
          ),
        ])
      ],
    );
  }
}
