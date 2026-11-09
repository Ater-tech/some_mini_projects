import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/offlineDB/pokemons_local_model.dart';

class HiveBoxService {
  static final boxName = "PokemonBox";  
  static void putPokemon(CardFormDetails pokemon){
    final invertPokemon = PokemonsLocalModel(
      name: pokemon.name,
      ability: pokemon.abilities,
      bgColor: pokemon.bgcolor,
      picture: pokemon.picture,
      headers: pokemon.headres,
      id: pokemon.about.order,
    );
    Hive.box<PokemonsLocalModel>(boxName).put(invertPokemon.id, invertPokemon);    
    }
  static List<PokemonsLocalModel> getLocalData(){
    return Hive.box<PokemonsLocalModel>(boxName).values.toList();
  } 
}
