import 'package:flutter/material.dart';
import 'app_barikki.dart';
import 'app_baruch.dart';
import 'appbarflexsiblespase.dart';

class BoshSahifa extends StatelessWidget {
  const BoshSahifa({super.key});
  
  final String title = 'Sinov app';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
        
        backgroundColor: Colors.amberAccent,
        elevation: 5,
        surfaceTintColor: Colors.redAccent,
        shadowColor: Colors.black12.withAlpha(180),        
        titleSpacing: 60.0,
        leading: InkWell(onTap: (){}, child: Icon(Icons.person_2_outlined)),
        actions: [const Icon(Icons.message_outlined)],
        // flexibleSpace: SliverAppBar(),
        title: Text(
          title,
          style: TextStyle(color: Colors.black38),
          ),
        centerTitle: false,
        //bottom: TabBar(tabs: [Tab(text: 'Home'), Tab(text: 'Profile')]),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppBarIkki()),
                );
              }, 
              child: Text('AppBar 2')),
            ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppBarUch())
                );
            },
            child: Text('App Bar 3')),
            ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GradientFon())
                );
            },
            child: Text('Gradientli fon')),
            Text(
              'Markazda yozuv hosil bo\'ldi',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
