import 'package:flutter/material.dart';

class APage extends StatelessWidget{
  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,      
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 200,
            title: Text("A page"),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            centerTitle: true,
            flexibleSpace: Image.asset("assets/photos/nature1.jpg", fit: BoxFit.cover),
            pinned: false,
            floating: true,            
          ),
          SliverFixedExtentList.builder(
            itemBuilder: (context, index) => 
            Card(
              child: Container(
                color: Colors.amberAccent[200],
                margin: EdgeInsets.all(12),
                // height: MediaQuery.sizeOf(context).height*0.1,
                child: Center(child: Text("pages $index"))),), 
            itemExtent: MediaQuery.sizeOf(context).height*0.2,
            itemCount: 12,
            )
        ],
      ),
    );    
  }
}