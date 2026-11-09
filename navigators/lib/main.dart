import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const NavigatorsApp());
}

class NavigatorsApp extends StatelessWidget {
  const NavigatorsApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Lear Navigate",
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)))),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}