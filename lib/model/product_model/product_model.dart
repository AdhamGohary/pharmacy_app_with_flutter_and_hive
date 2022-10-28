import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  String nameOfProduct;
  @HiveField(1)
  double priceOfProduct;
  @HiveField(2)
  String expireDateOfProduct;
  @HiveField(3)
  List<Map<dynamic,dynamic>>chemicalsList;
  ProductModel(
      {required this.nameOfProduct,
      required this.priceOfProduct,
      required this.expireDateOfProduct,
      required this.chemicalsList});
}
