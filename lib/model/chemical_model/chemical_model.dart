import 'package:hive/hive.dart';
part 'chemical_model.g.dart';

@HiveType(typeId: 0)
class ChemicalModel extends HiveObject {
  @HiveField(0)
  late String nameOfChemical;
  @HiveField(1)
  late double kiloOfChemical;
  @HiveField(2)
  late double priceOfKiloOfChemical;
  @HiveField(3)
  late String expireDateOfChemical;
  @HiveField(4)
  late double priceOfgramsOfChemical;
  @HiveField(5)
  late double gramsOfChemical;

  ChemicalModel(
      {required this.nameOfChemical,
      required this.kiloOfChemical,
      required this.priceOfKiloOfChemical,
      required this.expireDateOfChemical,
      required this.priceOfgramsOfChemical,
      required this.gramsOfChemical});
}
