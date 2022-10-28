import 'package:flutter/material.dart';
import 'package:pharmacy_app/ui/widgets/custom_data_table/custom_data_table.dart';
import 'package:pharmacy_app/ui/widgets/custom_data_table1/custom_data_table1.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List baseList;
  final String name;
  final int flag;
  CustomSearchDelegate(
      {required this.flag, required this.name, required this.baseList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List values = baseList;
    List filterNames = flag == 0
        ? values
            .where((element) =>
                element.nameOfChemical.contains(query.toUpperCase()))
            .toList()
        : values
            .where((element) =>
                element.nameOfProduct.contains(query.toUpperCase()))
            .toList();
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: ListView.builder(
          itemCount: query == '' ? values.length : filterNames.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
                width: width,
                height: 0.17 * height,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    flag == 0
                        ? CustomDataTable(
                            index: index,
                            filteredList: filterNames,
                          )
                        : CustomDataTable1(
                            label1: CustomTxt(
                                txt: 'nameOfProduct', txtStyle: style4),
                            dataCell1: CustomTxt(
                                txt: '${filterNames[index].nameOfProduct}',
                                txtStyle: style4),
                            label2: CustomTxt(
                                txt: 'priceOfProduct', txtStyle: style4),
                            dataCell2: CustomTxt(
                                txt: '${filterNames[index].priceOfProduct}',
                                txtStyle: style4),
                            label3: CustomTxt(
                                txt: 'expireDateOfProduct', txtStyle: style4),
                            dataCell3: CustomTxt(
                                txt:
                                    '${filterNames[index].expireDateOfProduct}',
                                txtStyle: style4)),
                  ],
                ));
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List values = baseList;
    List filterNames = flag == 0
        ? values
            .where((element) =>
                element.nameOfChemical.contains(query.toUpperCase()))
            .toList()
        : values
            .where((element) =>
                element.nameOfProduct.contains(query.toUpperCase()))
            .toList();

    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: ListView.builder(
          itemCount: query == '' ? values.length : filterNames.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
                width: width,
                height: 0.17 * height,
                child: query == ''
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          flag == 0
                              ? CustomDataTable(
                                  index: index,
                                  filteredList: values,
                                )
                              : CustomDataTable1(
                                  label1: CustomTxt(
                                      txt: 'nameOfProduct', txtStyle: style4),
                                  dataCell1: CustomTxt(
                                      txt: '${values[index].nameOfProduct}',
                                      txtStyle: style4),
                                  label2: CustomTxt(
                                      txt: 'priceOfProduct', txtStyle: style4),
                                  dataCell2: CustomTxt(
                                      txt: '${values[index].priceOfProduct}',
                                      txtStyle: style4),
                                  label3: CustomTxt(
                                      txt: 'expireDateOfProduct',
                                      txtStyle: style4),
                                  dataCell3: CustomTxt(
                                      txt:
                                          '${values[index].expireDateOfProduct}',
                                      txtStyle: style4)),
                        ],
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          flag == 0
                              ? CustomDataTable(
                                  index: index,
                                  filteredList: filterNames,
                                )
                              : CustomDataTable1(
                                  label1: CustomTxt(
                                      txt: 'nameOfProduct', txtStyle: style4),
                                  dataCell1: CustomTxt(
                                      txt:
                                          '${filterNames[index].nameOfProduct}',
                                      txtStyle: style4),
                                  label2: CustomTxt(
                                      txt: 'priceOfProduct', txtStyle: style4),
                                  dataCell2: CustomTxt(
                                      txt:
                                          '${filterNames[index].priceOfProduct}',
                                      txtStyle: style4),
                                  label3: CustomTxt(
                                      txt: 'expireDateOfProduct',
                                      txtStyle: style4),
                                  dataCell3: CustomTxt(
                                      txt:
                                          '${filterNames[index].expireDateOfProduct}',
                                      txtStyle: style4)),
                        ],
                      ));
          }),
    );
  }
}
