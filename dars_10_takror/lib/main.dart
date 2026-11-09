import 'package:flutter/material.dart';
import 'screens/home.dart';

void main(){
  runApp(RepeatApp());
}

class RepeatApp extends StatelessWidget{
  const RepeatApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Takrorshlash",
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme(
      //     brightness: Brightness.light, 
      //     primary: Colors.deepOrangeAccent, 
      //     onPrimary: Colors.black, 
      //     secondary: Colors.purpleAccent,
      //     onSecondary: Colors.white70,
      //     error: Colors.redAccent,
      //     onError: Colors.red,
      //     surface: Colors.blueGrey,
      //     onSurface: Colors.blueAccent,
      //     )),
      home: Home(),
    );
  }
}