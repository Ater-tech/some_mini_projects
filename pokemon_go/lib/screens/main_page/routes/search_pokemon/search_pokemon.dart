import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/list_pokemos/pokemons/pokemons_page.dart';

class SearchPokemon extends StatefulWidget{
  final List<CardFormDetails> pokemons;
  const SearchPokemon({super.key, required this.pokemons});

  @override
  State<SearchPokemon> createState()=> _StatePokemons();
}

class _StatePokemons extends State<SearchPokemon>{
  late List<CardFormDetails> _searchPokemons;

  @override
  void initState(){
    super.initState();
    _searchPokemons = widget.pokemons;
  }

  @override
  Widget build(BuildContext context){
    final List<CardFormDetails> pokemons = widget.pokemons;

    return Scaffold(
      appBar: AppBar(                
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 30.0, right: 8),
          child: TextFormField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.black87,),
              fillColor: Color(0xffd5d5d5),
              filled: true,
              hint: Text("Search: by pokemons name"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: (value) {              
              setState(() {
                _searchPokemons = pokemons.where((pokemon){
                  return pokemon.name.toLowerCase().contains(value.toLowerCase());
                })
                .toList();
              });
            },
          ),
        ),
      ),
      body: PokemonsPage(snapData: _searchPokemons),      
    );
  }
}