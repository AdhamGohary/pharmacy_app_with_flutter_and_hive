// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignUpModelAdapter extends TypeAdapter<SignUpModel> {
  @override
  final int typeId = 2;

  @override
  SignUpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignUpModel(
      email: fields[0] as String,
      password: fields[1] as String,
      pharmacyName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SignUpModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.pharmacyName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignUpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
