import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/offlineDB/pokemons_local_model.dart';
import 'package:pokemon_go/screens/favourite/fav_pokemons.dart';
import 'package:pokemon_go/service/hive_box_service.dart';

IconButton backButton(BuildContext context, Color color) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
      color: color,
    );
  }

IconButton favButtonAdd(BuildContext context, color, {required CardFormDetails pokemon}){
  
  return IconButton(
    onPressed: (){
    HiveBoxService.putPokemon(pokemon);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("ADDed to Favaurites"), 
      duration: Duration(seconds: 1),
      backgroundColor: Colors.black.withValues(alpha: 0.25),
      ));      
    }, 
    icon: Icon(Icons.favorite_border),
    color: color,
    );
}

IconButton favButtonList(BuildContext context, color){
  return IconButton(
    onPressed: (){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) {
            List<PokemonsLocalModel> pokemons = HiveBoxService.getLocalData();
            return FavPokemons(pokemons: pokemons);
            })
            );
    }, 
    icon: Icon(Icons.favorite_border),
    color: color,
    );
}