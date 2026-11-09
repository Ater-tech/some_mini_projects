import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(AllCourses());


class AllCourses extends StatelessWidget{
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}