import 'package:flutter/material.dart';
import 'package:pokedexappapi/model/pokedex_model.dart';

class SearchPage extends StatefulWidget {
  final PokedexModel? pokedex;
  const SearchPage({Key? key, this.pokedex}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Pokemon> _pokemons = [];
  Set<Pokemon> _searchedPokemons = {};

  @override
  void initState() {
    super.initState();
    _pokemons = widget.pokedex!.pokemon!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: TextFormField(
          decoration: InputDecoration(
            labelText: "Search",
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onChanged: (v) {
            _searchedPokemons.clear();
            for (Pokemon pokemon in _pokemons) {
              if (v.length == 0) {
                _searchedPokemons.clear();
                setState(() {});
              } else if (pokemon.name!.toLowerCase().contains(v)) {
                _searchedPokemons.add(pokemon);
                setState(() {});
              }
            }
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (contex, index) {
            return Text("${_searchedPokemons.toList()[index].name}");
          },
          itemCount: _searchedPokemons.length,
        ),
      ),
    );
  }
}
