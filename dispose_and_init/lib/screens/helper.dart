import 'package:flutter/material.dart';

class Helper extends StatelessWidget{
  const Helper({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar.medium(),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(
            [
              ElevatedButton(
                onPressed: ()=> Navigator.pop(context), 
                child: Text("Back"),),
              ]
          ), 
          itemExtent: 40)
      ],
    ),
  );
  }
}