import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';

class PokemonData {
  static Future<Map<String, dynamic>> getName(String? url) async {
    final dio = Dio();
    
    dio.options.headers = {
      'Accept': 'application/json',
      'User-Agent': 'Mozilla/5.0',
    };

    final respons = await dio.get(url!);
    if (respons.statusCode != 200) {
      debugPrint(respons.statusMessage);
    }
    // Bu yerda results ichidagi malumotlarni list<dinamik> qilib olinmoqda
    final List<dynamic> result = respons.data['results'] as List<dynamic>;
    
    // result ichidagi url dan malumot kutib olamiz
    // uning datasini va url ni qaytaramiz

    final futures = result.map((e) async {
      final url = e['url'];
      final detailData = await dio.get(url);      

      return CardFormDetails.fromJson({
        ...detailData.data,
      });
    }).toList();

    // ohirgi malumotlar qaytariladi
    final pokemons = await Future.wait(futures);
    return {
      'pokemons': pokemons,
      'nextUrl' : respons.data['next'],
    };
  }
}
