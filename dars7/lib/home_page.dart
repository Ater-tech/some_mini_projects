import 'package:dars7/random_names.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePage();
}

class _HomePage extends State<HomePage>{
  final List<String> names = namesL;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        title: Text(
          "Instagram",
          style: TextStyle(
            fontFamily: "InstaMainFont",
            fontWeight: FontWeight.w400,
          ),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border),),
            IconButton(onPressed: (){}, icon: Icon(Icons.bolt_rounded),),
          ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8,),
              itemBuilder: (context, index)=> circleAvatarUser(
                linkPhoto: "https://picsum.photos/200/200?random=$index", 
                name: names[index],
                context: context,
                ),
              itemCount: names.length,
            )),
          Expanded(
            flex: 8,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              
              itemBuilder: (context, userID) => newsUser(
                linkPhoto: "https://picsum.photos/800/800?random=$userID", 
                name: names[userID],
                context: context,
                info: "Information about ${names[userID]}",
                time: "15:15",
                liked: userID > 1? [names[userID-1], names[userID-2]]:[names[userID+1], names[userID+2]],
                lk: userID*100,
                cm: userID*10,
              ),
              itemCount: names.length,
            ),
            ),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: Icon(Icons.home_filled),), label: "Home", ),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined),), label: "Search"),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: Icon(Icons.one_k_plus_outlined)), label: "Plus"),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: Icon(Icons.movie_creation_outlined)), label: "Movie"),
          BottomNavigationBarItem(
            icon: CircleAvatar(maxRadius: 12, backgroundImage: NetworkImage("https://picsum.photos/100/100?random")),
            label: "My Profile",
            ),
        ],
        unselectedFontSize: 0.0,
        backgroundColor: Color(0xFFF8F8F8),
        ) 
    );
  }
}

Widget circleAvatarUser({String? name, String? linkPhoto, required BuildContext context}){
  return SizedBox( 
    height: MediaQuery.of(context).size.height*0.15,
    width: MediaQuery.of(context).size.height*0.15,
    child:  Column(
    children: [
      Container(
    height: MediaQuery.of(context).size.height*0.11,
    width: MediaQuery.of(context).size.height*0.11,
    // color: Colors.transparent,
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      
      shape: BoxShape.circle,
      // borderRadius: BorderRadius.circular(30.0),
      gradient: LinearGradient(colors: [        
        Colors.yellow,
        Colors.orange,
        Colors.redAccent,
        Colors.red,
        Colors.purple,
      ]      
      )
    ),
    child: Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: CircleAvatar(backgroundImage: NetworkImage('$linkPhoto'),),
    ),
  ),
  Text("$name", maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,),
    ],
  ));
}

Widget newsUser({
  required String linkPhoto, 
  String? name, 
  String? info, 
  String? time, 
  List<String>? liked, 
  int? lk, 
  int? cm, 
  required BuildContext context}){
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height*0.6,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(linkPhoto), fit: BoxFit.cover),
        ),
        child: ListTile(
          // tileColor: Color.fromRGBO(0, 0, 0, 0.5),
          title: Text("$name", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),),
          subtitle: Text("$info", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),),
          // trailing: Row(children: [
          //   ElevatedButton(onPressed: (){}, child: Text("Follow")),
          //   IconButton(onPressed: (){}, icon: Icon(Icons.menu_open))
          // ],),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.white,),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(linkPhoto),            
            ),
        ),
      ),
      Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height*0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [         
          Row(children: [
            IconButton(onPressed: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => 
              SecondPage(name: "$name"))), 
              icon: Icon(Icons.favorite, )), 
              Text("$lk"),            
          ],),
          Text(
            "Liked by ${liked![0]} and ${liked[1]}", 
            style: TextStyle(fontFamily: "InstaAppBar"), 
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,),
          Text("$time ago",),          
        ],)
      ),
    ],
  );
}
