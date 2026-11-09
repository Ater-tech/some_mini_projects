import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'screens/main_screen.dart';

void main(){
  runApp(FlutterToastApp());
}

class FlutterToastApp extends StatelessWidget{
  const FlutterToastApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      theme: ThemeData(iconTheme: IconThemeData(color: Colors.white), scaffoldBackgroundColor: Colors.cyan,),
      home: AppHome(),
    );
  }
}
