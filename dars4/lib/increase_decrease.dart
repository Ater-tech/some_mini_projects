import 'package:flutter/material.dart';

class HomeFive extends StatefulWidget{
  const HomeFive({super.key});
  @override
  State<HomeFive> createState() => _HomeFive();
}


class _HomeFive extends State<HomeFive>{
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beshinchi loyiha"),
        backgroundColor: Colors.greenAccent,
        iconTheme: IconThemeData(color: Colors.redAccent),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10), 
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.message_sharp),
              ),
            )
        ],
      ),
      body: Center(
        child: Container(
          margin: _counter > 0 ? EdgeInsets.only(bottom: 10.0 * _counter): EdgeInsets.only(top: -10.0 * _counter),
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.lightBlueAccent,
            child: Text(
            "$_counter",
            style: TextStyle(fontSize: 35),
                    ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
          // ! decrease
          FloatingActionButton(
            onPressed: () => decrease(),
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.remove),
            ),            
          // ! increase
          FloatingActionButton(
            onPressed: ()=> increase(),
            backgroundColor: Colors.greenAccent,
            child: Icon(Icons.add),
            ),
        ],
      ),
    );
  }

  void decrease(){
    setState(() {
      _counter--;
    });
  }

  void increase() => setState(() => _counter++);
}
