import './screens/home/bosh_sahifa.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const SimpleApp());
}

class SimpleApp extends StatelessWidget{
  const SimpleApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sinov app', 
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
      home: BoshSahifa(),
      );
  }
}
