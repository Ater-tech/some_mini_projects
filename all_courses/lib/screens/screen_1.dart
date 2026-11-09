import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Screen1 extends StatefulWidget{
  const Screen1({super.key});

  @override
  State<Screen1> createState()=> _Screen1();
}

class _Screen1 extends State<Screen1>{
  List<String> themes = [];
  
  @override
  void initState(){
    super.initState();
    loadData();
  }

  Future<void> loadData() async{
    final data = await rootBundle.loadString("assets/data/my_playlist.txt");
    setState(() {
      themes = data.split("\n");
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("FLutter course"), backgroundColor: Colors.cyanAccent.withValues(alpha: 0.8),),
      body: ListView.builder(
        itemCount: themes.length,
        itemBuilder: (_, i)=> ListTile(title: Text(themes[i]),)),
    );
  }
}