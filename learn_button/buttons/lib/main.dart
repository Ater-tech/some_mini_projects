import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp ({super.key});
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'FLutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Button tips learning'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {print('ElevatedButton clicked');},
              child: const Text('EB/Klick me!'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(onPressed: () {print('ElevatedButton.icon clicked');}, 
            label: const Text('EBI/Klick me!'), 
            icon: Icon(Icons.touch_app),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {print('OutlinedButton clicked');},
                child: const Text('OB/Klick me!'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,    
            ),
            ),
            const SizedBox(height: 20,),
          ],
        ), 
    ),
     floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton clicked');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
  ),
  ); 
  }  
}
