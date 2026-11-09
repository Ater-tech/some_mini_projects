import 'package:flutter/material.dart';

class BPage extends StatefulWidget{
  final String next;
  final String? info;
  const BPage({super.key, required this.next, this.info});

  @override 
  State<BPage> createState()=> _BPageState();
}

class _BPageState extends State<BPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"), 
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)),),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(widget.next),
            subtitle: Text("You pressed ${!(widget.info == null)?widget.info:"nothing"}"),
            ),
            itemCount: 2,
            ),
            ),
    );

  }
}