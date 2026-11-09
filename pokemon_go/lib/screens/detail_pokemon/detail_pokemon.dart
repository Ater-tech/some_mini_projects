import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/back_and_fav_buttons/back_fav_buttons.dart';
import 'package:pokemon_go/screens/detail_pokemon/tab_bar_ui/info_tab.dart';
import 'package:pokemon_go/styles/text_styles.dart';

class DetailPokemon extends StatefulWidget {
  final CardFormDetails pokemon;
  final Color backColor;
  const DetailPokemon({
    super.key, 
    required this.pokemon,
    required this.backColor,
    });

  @override
  State<DetailPokemon> createState() => _PokemonState();
}

class _PokemonState extends State<DetailPokemon> {
  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    return Scaffold(
      backgroundColor: widget.backColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: backButton(context, Colors.white),
        actions: [favButtonAdd(context, Colors.white, pokemon: pokemon)],
      ),
      body: SingleChildScrollView(child: bottomUI(pokemon)),
    );
  }

  SizedBox bottomUI(CardFormDetails pokemon) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Column(
            children: [
              namePokemon(pokemon),
              SizedBox(height: 15),
              abilityPokemon(pokemon),
            ],
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height*0.38,
            child: InfoTab(pokemon: pokemon),
            // infoPokemon(context, pokemon)
            ),
          Positioned(
            left: MediaQuery.sizeOf(context).width*0.2,
            top: MediaQuery.sizeOf(context).height*0.13,            
            child: picturePokemon(pokemon),
            ),
        ],
      ),
    );
  }

  CircleAvatar picturePokemon(CardFormDetails pokemon) {
    return CircleAvatar(
            maxRadius: MediaQuery.sizeOf(context).width*0.3,
            backgroundColor: Colors.white.withValues(alpha: 0.18),
            backgroundImage: CachedNetworkImageProvider(pokemon.picture),
          );
  }

  Padding abilityPokemon(CardFormDetails pokemon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Wrap(
              spacing: 8,
              children: pokemon.abilities
                  .map(
                    (e) => Container(
                      // height: 20,
                      // width: 20,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                      child: Text(e, style: whiteVerySmall()),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text("seed pokemon", style: whiteVerySmall()),
          ),
        ],
      ),
    );
  }

  Padding namePokemon(CardFormDetails pokemon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pokemon.name.toString().toUpperCase(), style: whiteBig()),
          Text("#${pokemon.about.order.toString()}", style: whiteSmall()),
        ],
      ),
    );
  }

}  
