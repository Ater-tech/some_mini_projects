// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalModelAdapter extends TypeAdapter<LocalModel> {
  @override
  final int typeId = 0;

  @override
  LocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalModel(
      name: fields[0] as String?,
      price: fields[1] as String?,
      isAviable: fields[2] as bool?,
      currency: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.isAviable)
      ..writeByte(3)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
