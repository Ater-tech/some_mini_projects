import 'package:flutter/material.dart';

class APage extends StatelessWidget{
  const APage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index)=> Container(
              color: Colors.blueAccent[100*(index%9)],
              height: MediaQuery.sizeOf(context).height*.1,
              child: Center(child: Text("Element $index")),
              ),
              childCount: 20,
            )
          )
      ],),
    );
  }
}