import 'dart:async';

import 'package:dispose_and_init/formtext/form_text.dart';
import 'package:dispose_and_init/screens/await_and_resume.dart';
import 'package:dispose_and_init/screens/method_page.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late Timer timer;
  @override
    void initState(){
      super.initState();
      timer = Timer.periodic(
        Duration(seconds: 1), 
        (timer) => debugPrint(
          "Timer: ${timer.tick}")
          );
    }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appBarSliver(),
          listItem(context),
        ],
      ),
      );
  }

  @override 
  void dispose(){
    debugPrint("This is despose metohd");
    timer.cancel();
    super.dispose();
  }

  void connectorDB(String item){
    debugPrint("Conected $item!!!");
  }
  SliverFixedExtentList listItem(BuildContext context) {
    return SliverFixedExtentList(
          itemExtent: MediaQuery.of(context).size.height*0.1,
          delegate: SliverChildListDelegate(              
            [
            Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 2)),
            myButtons(context, "Form page", "First page", FormPage()),
            myButtons(context, "Method page", "Second page", MethodPage()),
            myButtons(context, "Await and Resume page", "Third page", AwaitAndResume()),            
            myButtons(context, "Form Text in Flutter", "Fourth page", FormTextFlutter()),            
          ]
              ),
          );
  }

  InkWell myButtons(BuildContext context, String name, String subName, Widget page) {
    return InkWell(
          child: Card(
            child: ListTile(title: Text(name), subtitle: Text(subName), ),
          ),
        onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> page)),
        );
  }

  SliverAppBar appBarSliver() {
    return SliverAppBar.large(
          flexibleSpace: FlexibleSpaceBar(
            title: Text("FlexsibleSpace"),
            background: Image.asset(
              "assets/photos/butterfly.jpg",
            fit: BoxFit.cover,),
          ),
        );
  }
}