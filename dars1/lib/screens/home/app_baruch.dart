import 'package:flutter/material.dart';

class AppBarUch extends StatelessWidget {
  const AppBarUch({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DefaultTabcontroller'),
          backgroundColor: Color.from(alpha: 0.5, red: 0.2, green: 0.4, blue: 0.3),
          bottom: TabBar(tabs: [        
          Tab(text: 'First',  ),
          Tab(text: 'Second',),
          
        ],
        labelColor: Colors.yellowAccent,
        unselectedLabelColor: Colors.white54,
        indicatorColor: Colors.orangeAccent,
        indicator: BoxDecoration(color: Colors.purpleAccent, borderRadius: BorderRadius.circular(8.0)),
        // indicatorWeight: 4.0,
        // indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('1-sahifa'),),
            Center(child: Text('2-sahifa'),),
          ]),
      ),
    );
  }
}
