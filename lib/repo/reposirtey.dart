import 'package:pharmacy_app/model/product_model/product_model.dart';

abstract class Reposirtey {
  getAllProducts(int index/*, var value*/);
  addProduct(ProductModel productModel);
  deleteProduct(String id);
  updateProduct(String idAdd,String idDelete ,ProductModel productModel ,);
}
