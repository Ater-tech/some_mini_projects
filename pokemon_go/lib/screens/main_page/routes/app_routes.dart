import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/list_pokemos//pokemons_list_ui.dart';
import 'package:pokemon_go/screens/main_page/home_page.dart';
import 'package:pokemon_go/screens/main_page/routes/search_pokemon/search_pokemon.dart';

class AppRoutes {
  static const String home = "/";  
  static const String search = "/search";  
  static const String abilities = "/Abilities";  
  static const String pokemons = "/Pokemons";  
  static const String moves = "/Moves";  
  static const String mems = "/Mems";  
  static const String locations = "/Locations";  
  static const String typeCharts = "/Type Charts";  
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    
    switch(settings.name){
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);
          
      case AppRoutes.abilities:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);
      
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (_) => SearchPokemon(pokemons: (settings.arguments as List<CardFormDetails>),),);
          
      case AppRoutes.pokemons:
        return MaterialPageRoute(
          builder: (_) => PokemonsListUi(pokemons: (settings.arguments as List<CardFormDetails>)),);
          
      case AppRoutes.locations:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);
          
      case AppRoutes.mems:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);
          
      case AppRoutes.moves:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);
          
      case AppRoutes.typeCharts:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),);          
    }
  }
}