import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main()=> runApp(CreateDialog());

class CreateDialog extends StatelessWidget{
  const CreateDialog({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}