import 'package:flutter/material.dart';
import 'package:pokedexappapi/model/pokedex_model.dart';
import 'package:pokedexappapi/screens/home_page.dart';
import 'package:pokedexappapi/screens/info_page.dart';
import 'package:pokedexappapi/screens/search_page.dart';

class RouteHelper {
  static generate(RouteSettings settings) {
    Object? args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MyHomePage(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (context) => InfoPage(
            pokemon: (args as Pokemon),
          ),
        );
      case '/search':
        return MaterialPageRoute(
          builder: (context) => SearchPage(
            pokedex: (args as PokedexModel),
          ),
        );
    }
  }
}
