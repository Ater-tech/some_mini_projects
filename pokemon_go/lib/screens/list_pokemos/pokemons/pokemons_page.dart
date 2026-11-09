import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/pokemons_color/pok_colors.dart';
import 'package:pokemon_go/styles/text_styles.dart';
import 'package:pokemon_go/screens/detail_pokemon/detail_pokemon.dart';

class PokemonsPage extends StatefulWidget {
  final List<CardFormDetails> snapData;

  const PokemonsPage({super.key, required this.snapData});

  @override
  State<PokemonsPage> createState() => _PokemonState();
}

class _PokemonState extends State<PokemonsPage> {  
  @override
  Widget build(BuildContext context) {
    final snap = widget.snapData;
    return Scaffold(      
      body: Center(
            child: snap.isEmpty
              ?Center(child: Text("Empty", style:TextStyle(fontSize: 25),))
              :listPokemons(context, snap),
          ),
    );
  }

  ListView listPokemons(BuildContext context, List<CardFormDetails> snap) {
    return ListView.builder(
              itemBuilder: (context, index) {
                final data = snap[index];
                Color? bgColor = getPokemonColor(data.bgcolor);
                return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPokemon(
                      pokemon: data,
                      backColor: bgColor,
                      ),
                      ),
                  );
                },

                child: SizedBox(                  
                  height: MediaQuery.sizeOf(context).height*1/3,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myCard(context, data, bgColor),
                  )),                  
                );
              },
              
            itemCount: snap.length,
            );
  }
  
  Stack myCard(BuildContext context, CardFormDetails info, Color bgColor){    
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height*1/3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),            
          ),
        ),
        Positioned(
          top: 35,
          left: 25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.name.toUpperCase(),
                  style: whiteBig(),
                ),
            SizedBox(height: 20,),
            ...info.abilities.map(
              (ability)=> Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  ability,
                  style: whiteSmall(),
                  ),
              )),
            ],
          ),
            ),

        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(              
              shape: BoxShape.circle,
              
              image: DecorationImage(image: CachedNetworkImageProvider(info.picture), fit: BoxFit.cover),
              color: Color.fromARGB(90, 95, 189, 167)
            ),
          )
          ),
      ],
    );
  }

  Dialog infoPokemon(CardFormDetails data) {
    return Dialog(
    backgroundColor: Color.fromARGB(100, 255, 255, 255),
    child: SizedBox(
      height: 400,
      width: 400,
      child: Center(
        child: Text(data.headres.toString()),
      ),
    ),                    
                  );
  }
}
