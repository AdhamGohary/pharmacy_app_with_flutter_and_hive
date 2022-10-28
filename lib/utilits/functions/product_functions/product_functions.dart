import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/utilits/functions/const_functions/const_functions.dart';
import 'package:pharmacy_app/utilits/functions/const_widget_functins/const_widget_functions.dart';
import 'package:pharmacy_app/view-model/product_view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductFunctions {
  static deleteProduct(
      {required BuildContext context,
      required TextEditingController deletedProductController}) {
    if (Provider.of<ProductViewModel>(context, listen: false)
        .myBox1
        .containsKey(deletedProductController.text.toUpperCase().trim())) {
      Provider.of<ProductViewModel>(context, listen: false)
          .deleteProduct(deletedProductController.text.toUpperCase().trim());
      showAwsomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Congrates!',
          desc: 'Deleted Successfully');
    } else {
      showAwsomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: 'This Product do not exist');
    }
  }

  static editProduct(
      {required BuildContext context,
      required GlobalKey<FormState> priceOfProductKey,
      required GlobalKey<FormState> newNameProductKey,
      required TextEditingController nameProductController,
      required TextEditingController newNameProductController,
      required TextEditingController priceOfProductController,
      required String expire}) {
    try {
      var priceOfProductData = priceOfProductKey.currentState;
      var newNameProductData = newNameProductKey.currentState;
      if (priceOfProductData!.validate() &&
          newNameProductData!.validate() &&
          expire != null.toString()) {
        Provider.of<ProductViewModel>(context, listen: false).upDateProduct(
            nameProductController.text.toUpperCase().trim(),
            newNameProductController.text.toUpperCase().trim(),
            expire,
            double.parse(priceOfProductController.text));
        newNameProductController.clear();
        nameProductController.clear();
        priceOfProductController.clear();
        showAwsomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'congrets!',
            desc: 'Edit Successfully');
      } else {
        checkDebugMode('erroror');
      }
    } catch (e) {
      checkDebugMode(e);
    }
  }

 
}
