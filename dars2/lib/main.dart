import 'package:flutter/material.dart';
import 'windows/floatingactbutton.dart';
import 'windows/container.dart';
import 'windows/container3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  
  static List<String> myApps = ['container.dart', 'container3.dart'];
  static List<Widget> myWidgets = [Cont(), ExtraProperty()];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        fontFamily: 'Momo',
        
      ),
      home: FAB(),
    );
  }
}
