import 'package:flutter/material.dart';

class LstviewCustom2 extends StatefulWidget {
  LstviewCustom2({super.key});

  final List<String> fruits = ["apple", "melon", "banana", "o'rik", "grape", "shaftoli"];
  final List<Color> fruitsColors = [Colors.redAccent, Colors.yellowAccent, Colors.yellow, Colors.deepOrangeAccent, Colors.deepPurple, Colors.yellowAccent];
  @override
  State<LstviewCustom2> createState()=> _LstviewCustom2();
}

class _LstviewCustom2 extends State<LstviewCustom2>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverChildBuilderDelegate"),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => Container(
              margin: EdgeInsets.only(top: 20.0),
              color: widget.fruitsColors[index],
              child: Center(child: Text(widget.fruits[index], style: TextStyle(fontSize: 33.0),),),
          ), 
          childCount: widget.fruits.length,
          ),
          itemExtent: 200,
          ),
    );
  }
}