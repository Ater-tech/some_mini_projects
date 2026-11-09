import 'package:flutter/material.dart';
import 'home_pagee.dart';

void main(){
    runApp(RowAndColumn());
}

class RowAndColumn extends StatelessWidget{
  const RowAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Row and Column",
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
      ).copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
