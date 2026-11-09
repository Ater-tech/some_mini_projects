import 'package:flutter/material.dart';
import 'screens/screen_1.dart';
import 'screens/screen_2.dart';
import 'screens/screen_3.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePage();
}


class _HomePage extends State<HomePage>{

  static Map<String, String> courseNames = {
    "Flutter bo'yicha to'liq kurs": "by Aziza Murod",
    "Flutter bo'yicha kurs": "by Nursaidovuz",
    "Flutter bo'yicha kurs (tushuntirish bilan)": "by Saud Abdulwahed", 
  };

  List<Widget> screens = [Screen1(), Screen2(), Screen3()]; 
  final List<MapEntry<String, String>> entries = courseNames.entries.toList();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.withValues(alpha: 0.7),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white,)),
        title: Text("All coursers", style: TextStyle(fontSize: 25.0, color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more), color: Colors.white,),
        ],),
        body: ListView.builder(
          itemBuilder: (context, index) => SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*.15,
            child: Card(margin: EdgeInsets.only(top: 5.0), child: Center(child: 
            ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage("assets/photos/coding.jpg",),),
              title: Text(entries[index].key),
              subtitle: Text(entries[index].value),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screens[index])),
                  ),
                ),
              ),
            ),
          itemCount: courseNames.length,
          ),
    );
  }
}


