import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(InstagramInterface());

class InstagramInterface extends StatefulWidget{
 const InstagramInterface({super.key});
 @override
  State<InstagramInterface> createState()=> _InstagramInterface();
}


class _InstagramInterface extends State<InstagramInterface>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: WidgetStateProperty.all(Color.fromRGBO(0, 0, 0, 0.6)))),       
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
      ),
      title: "Instagram App",
      home: HomePage(),
    );
  }
}
