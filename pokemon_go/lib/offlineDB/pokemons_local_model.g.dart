// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonsLocalModelAdapter extends TypeAdapter<PokemonsLocalModel> {
  @override
  final int typeId = 0;

  @override
  PokemonsLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonsLocalModel(
      name: fields[0] as String?,
      ability: (fields[1] as List?)?.cast<String>(),
      bgColor: fields[3] as String?,
      headers: (fields[2] as List?)?.cast<String>(),
      picture: fields[4] as String?,
      id: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonsLocalModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ability)
      ..writeByte(2)
      ..write(obj.headers)
      ..writeByte(3)
      ..write(obj.bgColor)
      ..writeByte(4)
      ..write(obj.picture)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonsLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
