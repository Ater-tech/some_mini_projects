import 'package:flutter/material.dart';
String dataNews = "26 april 2025"; 
String newsPiclink = "assets/photos/pica.png";

SliverToBoxAdapter titleList(){
  return SliverToBoxAdapter(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("News", style: TextStyle(fontSize: 20),),
        TextButton(onPressed: (){}, child: Text("All news"))
      ],
    ),
  );
}

SliverList newsBar(BuildContext context) {
  return SliverList.builder(
    itemBuilder: (context, idex)=> ListTile(
      title: Text("Pokem go will update"),
      subtitle: Text(dataNews),
      trailing: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(newsPiclink), fit: BoxFit.cover),
        ),
      ),      
    ),
    itemCount: 10,
    );
}