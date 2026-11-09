import 'package:flutter/material.dart';

class ThisRowAndColumn extends StatelessWidget{
  const ThisRowAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram screen"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.redAccent,
      ),
      body: 
      Column(
      children: [
      SizedBox(height: 15,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
          
          Container(
            //margin: EdgeInsets.only(top: 15),
            color: const Color.fromRGBO(33, 150, 243, 1), 
            height: 210,
            width: 100,
            child: Column(children: [
              Image(image: AssetImage("assets/images/image1.jpg"), fit: BoxFit.cover,),
              Text("Hero!"),
            ],),
            ),
          Container(
            height: 210,
            width: 100,
            color: Colors.blue, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              // Image.asset("assets/images/image1.jpg", fit: BoxFit.cover,),
              Image(image: NetworkImage("https://images.pexels.com/photos/7218982/pexels-photo-7218982.jpeg")),
              Text("Hero!"),
            ],),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage("https://images.pexels.com/photos/1925630/pexels-photo-1925630.jpeg"),
              maxRadius: 45.0,
              child: Text("Ahmed"),
            ),          
      ],),]),
    );
  }
}