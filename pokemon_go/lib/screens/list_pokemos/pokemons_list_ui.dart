import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/back_and_fav_buttons/back_fav_buttons.dart';
import 'package:pokemon_go/screens/list_pokemos/pokemons/pokemons_page.dart';

class PokemonsListUi extends StatelessWidget{
  final List<CardFormDetails> pokemons;
  const PokemonsListUi({
    super.key,
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context, Colors.black),
        actions: [favButtonList(context, Colors.black)],        
        ),
      body: PokemonsPage(snapData: pokemons),
    );
  }
}