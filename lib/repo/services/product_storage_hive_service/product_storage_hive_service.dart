import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/product_model/product_model.dart';
import 'package:pharmacy_app/repo/reposirtey.dart';
import 'package:pharmacy_app/utilits/functions/const_functions/const_functions.dart';

class ProductStorageHiveService implements Reposirtey {
  @override
  addProduct(ProductModel productModel) {
    try {
      Box myBox = Hive.box<ProductModel>('productinfo');
      myBox.put(productModel.nameOfProduct, productModel);
    } catch (e) {
     checkDebugMode(e);
    }
  }

  @override
  deleteProduct(String id) {
    Box myBox = Hive.box<ProductModel>('productinfo');
    myBox.delete(id);
  }

  @override
  getAllProducts(int x/*,var value*/) {
    try {
      Box myBox = Hive.box<ProductModel>('productinfo');
      return myBox.getAt(x);
      
    } catch (e) {
     checkDebugMode(e);
    }
  }

  @override
  updateProduct(String  oldName,String newName,ProductModel productModel) {
    Box myBox = Hive.box<ProductModel>('productinfo');
    myBox.delete(oldName);
    myBox.put(newName, productModel);
  }
}
