import 'package:flutter/material.dart';
import 'courses/subjects_data.dart';
import 'courses/subjet_page_ui.dart';

class MyHome extends StatefulWidget{
  const MyHome({super.key});

  @override
  State <MyHome> createState()=> _MyHome();
}

class _MyHome extends State<MyHome>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text("My Courses", style: TextStyle(fontSize: 25, color: Colors.black87),),
              // centerTitle: true,
              background: Image.asset("assets/photos/teach.jpg", fit: BoxFit.cover,),
            ),
          ),
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: MyHeaderDelegate()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                child: myCard(index, subjects[index].name, context),
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SubjectPage(subject: subjects[index]))),
                ),
              childCount: subjects.length,
                )
            ),
            
        ],
      ),
    );
  }
}

Container myCard(int index, String name, BuildContext context){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        tileColor: Colors.deepOrangeAccent[100],
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 22,
          child: Text(name[0].toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        title: Text(name, style: TextStyle(),),
        subtitle: Text("Click to learn $name"),
      ), 
    ),
  );
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate{
  @override
  double get minExtent => 80;
  
  @override
  double get maxExtent => 80;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color:Colors.transparent,
      alignment: Alignment.center,
      child: Text("My Courses", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

