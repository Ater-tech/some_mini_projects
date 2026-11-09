import 'package:flutter/material.dart';

class BPage extends StatelessWidget{
  const BPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (_, __) => Container(
                color: Colors.greenAccent[100*(__%2)],
                height: MediaQuery.sizeOf(context).height*0.2,
                child: Center(child: Text("Widget $__"),),
              ),
              childCount: 10,
              ), 
              itemExtent: 200,              
              ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(20),
          sliver: SliverList.builder(
            itemBuilder: (context, index) => 
            Card(child: Center(child: Text("Last"),),),
            itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}