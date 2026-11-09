import 'package:flutter/material.dart';
import 'customscroll.dart';
import 'page_a.dart';
import 'page_b.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState()=> _Home();
} 

class _Home extends State<Home>{
  static List<Widget> pages = [ThisCustomScrollView(), APage(), BPage()];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Takrorlash"),
        backgroundColor: Colors.yellowAccent,
        ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
            child: Card(
              margin: EdgeInsets.only(top: 20),
              child:  SizedBox(                
                height: MediaQuery.of(context).size.height*.05, 
                child: Center(child: Text("Widget ${pages[index]}"))),
                ),
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => pages[index])),    
                ),
          childCount: pages.length,
        )),
    );
  }
}