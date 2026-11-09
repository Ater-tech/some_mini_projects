import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'first_page.dart';

void main() => runApp(LoyihaSakkiz());

class LoyihaSakkiz extends StatefulWidget{
  const LoyihaSakkiz({super.key});

  @override
  State<LoyihaSakkiz> createState() => _LoyihaSakkiz();
}

class _LoyihaSakkiz extends State<LoyihaSakkiz>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      builder: FToastBuilder(),
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

