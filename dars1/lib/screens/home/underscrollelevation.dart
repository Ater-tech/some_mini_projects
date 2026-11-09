import 'package:flutter/material.dart';

class UnderScrollEl extends StatelessWidget {
  const UnderScrollEl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Under scroll shape"),
        backgroundColor: Colors.blueAccent,
        scrolledUnderElevation: 8.0,
        shadowColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purpleAccent, Colors.lightBlueAccent],          
              ),            
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ListTile(
          title: Text("Item ${index+1}"),
          subtitle: Text("sub ${index + 1}"),
          isThreeLine: true,
          tileColor: Colors.transparent,
          leading: Icon(Icons.undo),
        ),
        )
      ),
    );
  }
}