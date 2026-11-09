import 'package:flutter/material.dart';
import 'screens/home_page.dart';
void main() => runApp(MainFunc());

class MainFunc extends StatelessWidget{
  const MainFunc({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}