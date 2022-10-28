// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chemical_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChemicalModelAdapter extends TypeAdapter<ChemicalModel> {
  @override
  final int typeId = 0;

  @override
  ChemicalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChemicalModel(
      nameOfChemical: fields[0] as String,
      kiloOfChemical: fields[1] as double,
      priceOfKiloOfChemical: fields[2] as double,
      expireDateOfChemical: fields[3] as String,
      priceOfgramsOfChemical: fields[4] as double,
      gramsOfChemical: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ChemicalModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nameOfChemical)
      ..writeByte(1)
      ..write(obj.kiloOfChemical)
      ..writeByte(2)
      ..write(obj.priceOfKiloOfChemical)
      ..writeByte(3)
      ..write(obj.expireDateOfChemical)
      ..writeByte(4)
      ..write(obj.priceOfgramsOfChemical)
      ..writeByte(5)
      ..write(obj.gramsOfChemical);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChemicalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
