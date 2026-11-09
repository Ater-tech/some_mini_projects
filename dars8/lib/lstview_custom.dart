import 'package:flutter/material.dart';

class LstviewCustom extends StatefulWidget {
  const LstviewCustom({super.key});

  @override
  State<LstviewCustom> createState() => _LstviewCustom();
}

class _LstviewCustom extends State<LstviewCustom>{
  @override
  Widget build(BuildContext contex){
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.custom"),
        backgroundColor: Colors.transparent,
        ),
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(
        cardWidgets(30),
        )),
    );
  }
}

List<Widget> cardWidgets(int n){
  List<Widget> widgets = List.generate(n, (index) => 
    Card(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 50,
        child: Center(child: Text("Widget ${index+1}"),),
      ),
      )
  );
  return widgets;
}