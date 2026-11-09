import 'package:flutter/material.dart';

class LstVBuilder extends StatelessWidget{
  const LstVBuilder({super.key});

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
      body: ListView.builder(
        scrollDirection: Axis.vertical, 
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://random.imagecdn.app/400/400"),
            ),
            title: Text("User $index"),
            subtitle: Text("15:08"),
            trailing: IconButton(
              hoverColor: Colors.amberAccent,
              splashColor: Colors.amberAccent,
              highlightColor: Colors.greenAccent,
              onPressed: (){}, 
              icon: Icon(Icons.arrow_forward_ios,
              
              )),
          ),
        ),
        itemCount: 30000,
      ),
      );
  }
}