import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedexappapi/model/pokedex_model.dart';

class ServicePokedex extends Object {
  static Future<PokedexModel> getPokedex() async {
    Response res = await Dio().get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    return PokedexModel.fromJson(jsonDecode(res.data));
  }
}
