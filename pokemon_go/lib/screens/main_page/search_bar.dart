import 'package:flutter/material.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/main_page/routes/app_routes.dart';

SliverPadding searchBar(BuildContext context, List<CardFormDetails>? pokemons, String status){
  return SliverPadding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 4, vertical: 15), 
    sliver: SliverToBoxAdapter(
      child: InkWell(
        onTap: () => status == "isLoading"
        ?alertDioalog(context, status)
        : status == "hasError"
        ?alertDioalog(context, status):
        Navigator.pushNamed(context, AppRoutes.search, arguments: pokemons),
        child: TextFormField(        
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            suffixIcon: Icon(Icons.search, color: Colors.black,),
            fillColor: Color(0xffd5d5d5),
            hint: Text("Search: by pokemons name"),
          ),
        ),
      ),
    ),
    );
}

Future<dynamic> alertDioalog(BuildContext context, String status) => showDialog(
  context: context, 
  builder: (context)=> AlertDialog(
    icon: Icon(Icons.error),
    title: Text("Data is $status"),
  )
  );
