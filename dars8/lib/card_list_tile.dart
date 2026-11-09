import 'package:flutter/material.dart';

class NameList extends StatelessWidget{
  const NameList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name List"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.info)),
          IconButton(onPressed: (){}, icon: Icon(Icons.help))
        ],
        
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(child: ListTile(
          leading: Icon(Icons.person_2),
          title: Text("Name $index"),
          tileColor: index.isEven? Colors.amberAccent: Colors.cyanAccent,
          trailing: Icon(Icons.add_a_photo),
        ),)),
    );  
  }
}