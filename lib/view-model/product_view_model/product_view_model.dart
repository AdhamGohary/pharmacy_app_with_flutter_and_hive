import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/product_model/product_model.dart';
import 'package:pharmacy_app/repo/services/product_storage_hive_service/product_storage_hive_service.dart';

class ProductViewModel with ChangeNotifier {
  ProductStorageHiveService productRepo = ProductStorageHiveService();
  Box myBox1 = Hive.box<ProductModel>('productinfo');
  late double priceOfProduct;
  late List productList;
  late String nameOfProduct;
  ProductViewModel();
  addProduct(String nameOfProduct, double priceOfProduct,
      String expireDateOfProduct, List<Map<String, dynamic>> chemicalsList) {
    productRepo.addProduct(ProductModel(
        nameOfProduct: nameOfProduct,
        priceOfProduct: priceOfProduct,
        expireDateOfProduct: expireDateOfProduct,
        chemicalsList: chemicalsList));
    notifyListeners();
  }

  upDateProduct(String oldNameOfProduct, String newNameOfProduct,
      String expireDateOfProduct, double priceOfProduct) {
    productRepo.updateProduct(
        oldNameOfProduct,
        newNameOfProduct,
        ProductModel(
            nameOfProduct: newNameOfProduct,
            priceOfProduct: priceOfProduct,
            expireDateOfProduct: expireDateOfProduct,
            chemicalsList: []));
    notifyListeners();
  }

  getAllProducts(int x) {
    notifyListeners();
    var products = productRepo.getAllProducts(x);
    productList.addAll(products);

    return productList;
  }

  deleteProduct(String id) {
    productRepo.deleteProduct(id);
    notifyListeners();
  }
}
