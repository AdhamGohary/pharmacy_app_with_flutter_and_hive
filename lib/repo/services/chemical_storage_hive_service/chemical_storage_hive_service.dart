import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy_app/model/chemical_model/chemical_model.dart';
import 'package:pharmacy_app/utilits/functions/const_functions/const_functions.dart';


class ChemicalStorageHiveService {
  static ChemicalStorageHiveService auth = ChemicalStorageHiveService();
  late Box myBox;

  addChemical(String nameOfChemical, double kiloOfChemical,
      double priceOfKiloOfChemical, String expireDateOfChemical) async {
    myBox = Hive.box<ChemicalModel>('chemicalinfo');

    try {
      await myBox.put(
          nameOfChemical,
          ChemicalModel(
              nameOfChemical: nameOfChemical,
              kiloOfChemical: kiloOfChemical,
              priceOfKiloOfChemical: priceOfKiloOfChemical,
              expireDateOfChemical: expireDateOfChemical,
              gramsOfChemical: kiloOfChemical * 1000,
              priceOfgramsOfChemical: priceOfKiloOfChemical / 1000));
    } catch (e) {
     checkDebugMode(e);
    }
  }

  viewChemical(int index) async {
    myBox = Hive.box<ChemicalModel>('chemicalinfo');
    myBox.getAt(index).nameOfChemical;
  }

  deleteChemical(var key) async {
    myBox = Hive.box<ChemicalModel>('chemicalinfo');
    myBox.delete(key);
  }

  /* @override
  addProduct(ChemicalModel chemicalModel) async {
    myBox = Hive.box<ChemicalModel>('chemicalinfo');

    try {
      await myBox.put(
          chemicalModel.nameOfChemical,
          ChemicalModel(
              nameOfChemical: chemicalModel.nameOfChemical,
              kiloOfChemical: chemicalModel.kiloOfChemical,
              priceOfKiloOfChemical: chemicalModel.priceOfKiloOfChemical,
              expireDateOfChemical: chemicalModel.expireDateOfChemical,
              gramsOfChemical: chemicalModel.kiloOfChemical * 1000,
              priceOfgramsOfChemical:
                  chemicalModel.priceOfKiloOfChemical / 1000));
    } catch (e) {}
  }

  @override
  deleteProduct(String id) {}

  @override
  getAllProducts(int index) {
    
    myBox = Hive.box<ChemicalModel>('chemicalinfo');
    
  }

  @override
  updateProduct(String id, ChemicalModel chemicalModel) {}*/
}
