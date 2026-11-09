import 'package:flutter/material.dart';
import 'package:navigators/screens/third.dart';

class CPage extends StatefulWidget{
  const CPage({super.key});

  @override
  State<CPage> createState()=> _StatePage();
}

class _StatePage extends State<CPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("C page"),),
      body: Center(child: InkWell(
        child: Card(
          color: Colors.amberAccent, 
          child: SizedBox(
            height: 200, 
            width: double.infinity,
            child: Center(child: Text("C page")),),),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> 
      BPage(
        next: "C orqali ochildi", 
        info: "Siz sahifani C orqali ochdingiz",))),
      ),
      ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_back),
      onPressed: ()=> Navigator.pop(context, "C dan orqaga qaytildi")),
    );    
  }
}