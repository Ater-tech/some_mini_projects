import 'package:dars4/list_view_user_data.dart';
import 'package:flutter/material.dart';
import 'increase_decrease.dart';
import 'list_view.dart';
import 'list_view_second.dart';
import 'list_view_builder.dart';

void main(){
  runApp(LoyihaBesh());
}
class LoyihaBesh extends StatelessWidget{
  const LoyihaBesh({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      title: "List view loyihasi",
      home: FourthProject(),
    );
  }
}


class FourthProject extends StatelessWidget {
  FourthProject({super.key});

  final List<Widget> projects = [LstV(), HomeFive(), LstVSecond(), LstVBuilder(), LstVUserData()];
  final List<String> names = ["ListView with divider", "FAB", "ListView With Card", "ListView.builder", "ListView with UserData"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth project"),
        backgroundColor: Colors.greenAccent,
        elevation: 10,
        shadowColor: Colors.yellowAccent,
        leading: IconButton(onPressed:(){}, icon: Icon(Icons.help)),
        actions: [
            IconButton(onPressed:(){}, icon: Icon(Icons.select_all)),
            IconButton(onPressed:(){}, icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          tileColor: Colors.blueAccent,
          title: Text(names[index]),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => projects[index]),
          ),
        ), 
        separatorBuilder: (context, index) => SizedBox(height: 8,), 
        itemCount: projects.length),
    );
  }
}
