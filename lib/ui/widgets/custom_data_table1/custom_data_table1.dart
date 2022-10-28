import 'package:flutter/material.dart';

class CustomDataTable1 extends StatefulWidget {
  final Widget label1;
  final Widget label2;
  final Widget label3;
  final Widget dataCell1;
  final Widget dataCell2;
  final Widget dataCell3;
  final void Function()? function;
  const CustomDataTable1(
      {Key? key,
      required this.label1,
      required this.dataCell1,
      required this.label2,
      required this.dataCell2,
      required this.label3,
      required this.dataCell3,
      this.function})
      : super(key: key);

  @override
  State<CustomDataTable1> createState() => _CustomDataTable1State();
}

class _CustomDataTable1State extends State<CustomDataTable1> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: const MaterialStatePropertyAll(Color.fromARGB(255,105, 238, 240)),
      border: TableBorder.all(color: Colors.white),
      showBottomBorder: true,
      columns: [
        DataColumn(label: widget.label1),
        DataColumn(label: widget.label2),
        DataColumn(label: widget.label3),
      ],
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(widget.dataCell1,
              showEditIcon: true, onTap: widget.function),
          DataCell(widget.dataCell2),
          DataCell(widget.dataCell3),
        ])
      ],
    );
  }
}
