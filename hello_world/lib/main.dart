import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.grey,
      ),
      //home: const MyHomePage(title: 'My first app with Flutter'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first app with Flutter', style: TextStyle(color: Colors.blueAccent),),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true, 
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/girl_in_forest.jpg'),
            width: 300,
            ),

          /*
          child: Image(
            image: NetworkImage('https://images.unsplash.com/photo-1444011283387-7b0f76371f12?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Z2lybCUyMG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D'),
            width: 300,)
          
          child: Text('Hello, world!', style: TextStyle(
            fontSize: 24,
            color: Colors.pink, 
            fontFamily: 'Michroma',
            ),),
            */
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            print("Floating Action Button clicked!");
          },
          child: Text("Click"),
        ),
      ),
    );
  }
}
