import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget{
  final String name;
  const SecondPage({super.key, required this.name});

  @override
  State<SecondPage> createState()=> _SecondPage();
}

class _SecondPage extends State<SecondPage>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(      
      body: Column(
        children: [
          Expanded(flex: 3, child: Stack(
            children: [              
              SizedBox(
                width: double.infinity,
                child: Image.network('https://picsum.photos/400/400?random', fit: BoxFit.cover,),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Opacity(
                opacity: 0.5,
                child: Chip(
                  label: Text("${widget.name}'s picture", style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.black,
                    ),
              ),
                )
            ],
          ),),
          Expanded(flex: 5, child: Container(color: Colors.cyanAccent,),),
        ],
      ),
    );
  }
}