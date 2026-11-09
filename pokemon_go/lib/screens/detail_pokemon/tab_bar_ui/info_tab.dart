import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';

class InfoTab extends StatefulWidget{
  final CardFormDetails pokemon;  
  
  const InfoTab({super.key, required this.pokemon});

  @override
  State<InfoTab> createState()=> _StateTab();
}


class _StateTab extends State<InfoTab>{
  @override
  Widget build(BuildContext context){
  final pokemon = widget.pokemon;
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
      decoration: BoxDecoration(
        color: Color(0xffe4edee),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: infoTab(pokemon),
    );
  }
    DefaultTabController infoTab(CardFormDetails pokemon) => DefaultTabController(
    length: 4, 
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          // padding: EdgeInsets.symmetric(horizontal: 1),
          child: TabBar(
            isScrollable: true,
            // labelStyle: TextStyle(fontSize: 11),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.grey,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: "About",),
              Tab(text: "Stats"),
              Tab(text: "Evolution",),
              Tab(text: "Moves",),
            ] ),
        ),
        Expanded(
          child: TabBarView(            
            children: [
              Text(pokemon.headres.toString()),
              Text(pokemon.headres.toString()),
              Text(pokemon.headres.toString()),
              Text(pokemon.headres.toString()),
            ])
          ),
      ],
    ),

      );  
}