import 'package:flutter/material.dart';

class LstVSecond extends StatelessWidget{
  LstVSecond({super.key});
  final List<Widget> widgets = List.generate(
    30, (index) {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://random.imagecdn.app/500/500"),
          ),
          title: Text("Allan Jordan"),
          subtitle: Text("15:07"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ),
);
    } 
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(onPressed: (){}, child: Text(
          "Guest", 
          style: TextStyle(
            fontSize: 25,
            color: Colors.amberAccent), 
            ), 
            ),
        // backgroundColor: Colors.amber,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical, 
        children: widgets,
      ),
      );
  }
}