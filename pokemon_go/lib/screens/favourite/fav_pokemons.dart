import 'package:flutter/material.dart';
import 'package:pokemon_go/offlineDB/pokemons_local_model.dart';
import 'package:pokemon_go/screens/back_and_fav_buttons/back_fav_buttons.dart';

class FavPokemons extends StatefulWidget{
  final List<PokemonsLocalModel> pokemons;
  const FavPokemons({
    super.key,
    required this.pokemons,
    });

  @override
  State<FavPokemons> createState()=> _PokemonState();
}

class _PokemonState extends State<FavPokemons>{
  @override
  Widget build(BuildContext context){
    final pokemons = widget.pokemons;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("My favourite Pokemons"),
        leading: backButton(context, Colors.black),        
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,          
          child: ListView.builder(
            itemBuilder:
            (context, index) {
              final pokemon = pokemons[index];
              return ListTile(title: Text(pokemon.name.toString()),);
            },
            itemCount: pokemons.length,
            ),
        ),
      ),
    );
  }
}