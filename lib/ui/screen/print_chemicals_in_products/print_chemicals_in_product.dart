import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';
import 'package:pharmacy_app/view-model/product_view_model/product_view_model.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
PrintChemiclasInProduct({
  required BuildContext buildContext,
  required Box myBox,
  required double height,
  required double width,
}) =>
    pw.ListView(children: [
      pw.Padding(
        padding: pw.EdgeInsets.only(top: 0.05 * height, bottom: 0.05 * height),
        child: pw.Text(
          "Product : ${Provider.of<ProductViewModel>(buildContext, listen: false).nameOfProduct} ",
        ),
      ),
      pw.Center(
        child: pw.Text('Ingredients:'),
      ),
      pw.Padding(
        padding: pw.EdgeInsets.only(top: 0.005 * height),
        child: pw.Row(
          children: [
            pw.Text('Name'),
            pw.Padding(
              padding:const pw.EdgeInsets.symmetric(horizontal: 50),
              child: pw.Text('Amount'),
            ),
            pw.Text('Price Of Chemical'),
          ],
        ),
      ),
      pw.SizedBox(
          height: 0.2333132 * height,
          child: pw.ListView.builder(
              itemCount: myBox
                  .get(
                      Provider.of<ProductViewModel>(buildContext, listen: false)
                          .nameOfProduct)
                  .chemicalsList
                  .length,
              itemBuilder: (context, index) {
                return pw.Row(
                  children: [
                    pw.Text(
                        '${myBox.get(Provider.of<ProductViewModel>(buildContext, listen: false).nameOfProduct).chemicalsList[index]["nameOfChemical"]}'),
                    pw.Padding(
                      padding:const pw.EdgeInsets.symmetric(horizontal: 50),
                      child: pw.Text(
                        '${myBox.get(Provider.of<ProductViewModel>(buildContext, listen: false).nameOfProduct).chemicalsList[index]['amountOfChemical']}',
                      ),
                    ),
                    pw.Padding(
                      padding:const pw.EdgeInsets.only(left: 20),
                      child:
                    pw.Text(
                      '${myBox.get(Provider.of<ProductViewModel>(buildContext, listen: false).nameOfProduct).chemicalsList[index]['priceOfAmountOfChemical']}',
                    ),)
                  ],
                );
              })),
      pw.Padding(
          padding: pw.EdgeInsets.only(top: 0.05 * height),
          child: pw.Center(
            child: pw.Text(
              'Price Of Product:${Provider.of<ProductViewModel>(buildContext, listen: false).priceOfProduct}',
            ),
          ))
    ]);
