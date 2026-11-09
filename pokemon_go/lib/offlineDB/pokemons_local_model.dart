import 'package:hive_flutter/hive_flutter.dart';
part 'pokemons_local_model.g.dart';

@HiveType(typeId: 0)
class PokemonsLocalModel {
@HiveField(0)
String? name;
@HiveField(1)
List<String>? ability;
@HiveField(2)
List<String>? headers;
@HiveField(3)
String? bgColor;
@HiveField(4)
String? picture;
@HiveField(5)
int? id;


PokemonsLocalModel({
  this.name,
  this.ability,
  this.bgColor,
  this.headers,
  this.picture,
  this.id,
});
}