import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/main_page/search_bar.dart';

List<String> name = [
  "Pokemons", "Moves", "Abilities", 
  "Mems", "Locations", "Type Charts"];

List<Color> color = [
  Color.fromRGBO(79, 193, 166, 1), Color(0xfff77769), Colors.blue, 
  Color.fromRGBO(254, 218, 88, .8), Colors.deepPurpleAccent, Color(0xffb1726b), 
  ];

SliverPadding listWd(BuildContext context, List<CardFormDetails>? data, String status){    
  return SliverPadding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 4, vertical: 4),
    sliver: 
    SliverGrid.builder(    
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 18,
        childAspectRatio: 2,
        ),
      itemBuilder: (context, index) => InkWell(        
        onTap: () => status == 'isLoading'
        ?alertDioalog(context, status)
        :status == 'hasError'
        ?alertDioalog(context, status)
        :Navigator.pushNamed(context, "/${name[index]}", arguments: data),
        child: menyList(context, name[index], color[index], status),
      ),
      itemCount: name.length,      
    ),
  );
}

Container menyList(BuildContext context, String title, Color color, String status) => Container(    
  alignment: Alignment(0.01, 0.5),  
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(title, style: TextStyle(fontSize: 20, color: Colors.white),),
      status == "isLoading"
        ?CircularProgressIndicator():
        status == "hasError"
          ?Icon(Icons.error, color: Colors.white,)
          :Icon(Icons.check, color: Colors.white,)
    ],
  ),
);