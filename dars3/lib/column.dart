import 'package:flutter/material.dart';

class ThisColumn extends StatelessWidget{
  
  const ThisColumn({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.circle_notifications, color: Colors.amber, size: 63,),
            Icon(Icons.circle_notifications, color: Colors.amber, size: 63,),
            Icon(Icons.circle_notifications, color: Colors.amber, size: 63,),
            Icon(Icons.circle_notifications, color: Colors.amber, size: 63,),
            // Icon(Icons.circle_notifications, color: Colors.amber, size: 63,),
            // Icon(Icons.circle_notifications, color: Colors.amber, size: 63,),
          ],
        ),
      );
  }
}