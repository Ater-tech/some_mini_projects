import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(ThisHomePage());


class ThisHomePage extends StatelessWidget{
  const ThisHomePage({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: MyHome(),
    );
  }
}