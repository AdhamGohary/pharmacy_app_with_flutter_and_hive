import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/product_model/product_model.dart';
import 'package:pharmacy_app/ui/widgets/custom_txt/custom_txt.dart';
import 'package:pharmacy_app/utilits/constants/font_style.dart';
import 'package:pharmacy_app/utilits/constants/strings.dart';
import 'package:pharmacy_app/utilits/functions/const_functions.dart';
import 'package:pharmacy_app/view-model/product_view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ChemicalsInProduct extends StatefulWidget {
  const ChemicalsInProduct({Key? key}) : super(key: key);

  @override
  State<ChemicalsInProduct> createState() => _ChemicalsInProductState();
}

class _ChemicalsInProductState extends State<ChemicalsInProduct> {
  late Box myBox;
  @override
  void initState() {
    myBox = Hive.box<ProductModel>('productinfo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 0.85 * height),
          child: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              ConstFucnctions.createPdf(context);
            },
            child: IconButton(
                onPressed: () {
                  ConstFucnctions.createPdf(context);
                },
                icon: const Icon(Icons.print)),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.1 * height),
          child: AppBar(
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            title:
                CustomTxt(txt: nameOfApp, txtStyle: style1),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 0.05 * height, bottom: 0.05 * height),
              child: CustomTxt(
                  txt:
                      "Product : ${context.watch<ProductViewModel>().nameOfProduct}",
                  txtStyle: style1),
            ),
            Center(
              child: CustomTxt(txt: 'Ingredients:', txtStyle: style1),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.05 * height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.01 * width),
                    child: CustomTxt(txt: 'Name', txtStyle: style4),
                  ),
                  CustomTxt(txt: 'Amount', txtStyle: style4),
                  CustomTxt(
                      txt: 'Price Of Chemical', txtStyle: style4)
                ],
              ),
            ),
            SizedBox(
              height: 0.5 * height,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CustomTxt(
                        txt:
                            '${myBox.get(context.watch<ProductViewModel>().nameOfProduct).chemicalsList[index]["nameOfChemical"]}',
                        txtStyle: style4),
                    title: Padding(
                      padding: EdgeInsets.only(left: 0.15 * width),
                      child: CustomTxt(
                          txt:
                              '${myBox.get(context.watch<ProductViewModel>().nameOfProduct).chemicalsList[index]['amountOfChemical']}',
                          txtStyle: style4),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 0.05 * width),
                      child: CustomTxt(
                          txt:
                              '${myBox.get(context.watch<ProductViewModel>().nameOfProduct).chemicalsList[index]['priceOfAmountOfChemical']}',
                          txtStyle: style4),
                    ),
                  );
                },
                itemCount: myBox
                    .get(context.watch<ProductViewModel>().nameOfProduct)
                    .chemicalsList
                    .length,
              ),
            ),
            Center(
              child: CustomTxt(
                  txt:
                      'Price Of Product:${context.watch<ProductViewModel>().priceOfProduct}',
                  txtStyle: style1),
            )
          ],
        ));
  }
}
