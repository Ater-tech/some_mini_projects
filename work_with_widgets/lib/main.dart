import 'package:flutter/material.dart';
import 'pages/second_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'Widget Navigation Example',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> fruitList = [
    'Apple',
    'Melon',
    'Watermelon',
    'Orange',
    'Banana',
  ];

void openFruitEditor() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageWithListView(fruits: fruitList)),
    );
    
    if (result != null && result is List<String>) {
      setState(() {
        fruitList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page\nTry these buttons',
          textAlign: TextAlign.center,
          ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageWithColumn(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('See page build with column widget'),
            ),
            SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageWithRow(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('See page build with row widget'),
            ),
            SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageAvatar(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('See page avatar widget'),
            ),
            
            SizedBox(height: 20), // Add some space between buttons
            
            ElevatedButton(
              onPressed: openFruitEditor,
              
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('See page build with list view'),
            ),  

            SizedBox(height: 20), // Add some space between buttons  

            // for exit button
            /*
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Exit(),
                  ),
                );
              },
              
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('Exit'),
            ),*/
          ]
      ),
      ),
    );
  }
}

