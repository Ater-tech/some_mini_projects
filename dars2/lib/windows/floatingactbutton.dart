import 'package:dars2/main.dart';
import 'package:flutter/material.dart';
import 'container2.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.blueAccent,),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          // image: DecorationImage(image: AssetImage(''), fit: BoxFit.cover)
        ),
        child: CustomScrollView(
        // scrollBehavior bu tepaga va pastga scroll qilishdagi ajoyib effekt
        
        scrollBehavior: ScrollBehavior(),
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("FAB"),
              background: Image.asset(
                "assets/images/image1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                child: ListTile(
                title: Text(MyApp.myApps[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp.myWidgets[index]),
                  );
                },
              ),
              ),
              childCount: MyApp.myApps.length,
            ),
            
          ),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Cont2()));},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 8,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellowAccent,
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling, //
    );
  }
}
