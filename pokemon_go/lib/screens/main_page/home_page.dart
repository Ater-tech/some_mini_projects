import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokemon_go/model/card_form_details.dart';
import 'package:pokemon_go/screens/main_page/list_wd.dart';
import 'package:pokemon_go/screens/main_page/news.dart';
import 'package:pokemon_go/screens/main_page/search_bar.dart';
import 'package:pokemon_go/service/name.dart';
import 'bar_wd.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomeState();
}

class _HomeState extends State<HomePage>{  
  String? url = dotenv.env['BaseUrl'] ;
  String status = "Ok";
  bool isLoading = false;
  List<CardFormDetails> pokemons = [];

  @override
  void initState(){
    super.initState();
    loadFirstPage();
    setState(() {
      status = "isLoading";
    });
  }

  Future<void> loadFirstPage() async{
    await loadMore();
    loadRemainingInBackground();
  }  

  Future<void> loadRemainingInBackground() async{
    while(url !=null){
      await loadMore();
    }
  }

  Future<void> loadMore() async{
    if(url == null || isLoading) return;
    isLoading = true;
    setState(() {
      status = "Ok";
    });
    try {final data = await PokemonData.getName(url);
    
    setState(() {
      pokemons.addAll(data['pokemons'] as List<CardFormDetails>);
      url = (data['nextUrl'] as String?);
    });
    } catch(e){
      status =  'hasError';
    }

    isLoading = false;
  }

  @override
  void dispose(){
    super.dispose();    
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfffffffd),      
      body: firstPage(pokemons, context, status),
    );
  }

  CustomScrollView firstPage(
    List<CardFormDetails> pokemons, 
    BuildContext context, 
    String status) {   
    return CustomScrollView(
        slivers: [
          bar(),
          searchBar(context, pokemons, status),
          listWd(context, pokemons, status),                  
          titleList(),
          newsBar(context),
        ],
      );
  }
}
