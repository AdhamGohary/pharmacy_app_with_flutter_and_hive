import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pharmacy_app/model/product_model/product_model.dart';
import 'package:pharmacy_app/ui/screen/print_chemicals_in_products/print_chemicals_in_product.dart';
import 'package:pharmacy_app/utilits/screen_size/screen_size.dart';


import 'package:printing/printing.dart';

class ConstFucnctions {
  static Future<void> createPdf(BuildContext buildContext) async {
    final doc = pw.Document();
    final myBox = Hive.box<ProductModel>('productinfo');
    double height = getHeight(context: buildContext);
    double width = getwidth(context: buildContext);
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a6,
        build: (context) => pw.Center(
                child: pw.Column(children: [
              PrintChemiclasInProduct(
                buildContext: buildContext,
                myBox: myBox,
                height: height,
                width: width,
              )
            ]))));
    await Printing.layoutPdf(onLayout: (PdfPageFormat pdf) async => doc.save());
  }
}
