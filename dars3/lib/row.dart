import 'package:flutter/material.dart';

class ThisRow extends StatelessWidget {
  const ThisRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row property"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 1, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: wLeftSide())),
          Expanded(flex: 4, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisSize: MainAxisSize.max, children: wCenter())),
          Expanded(flex: 1, child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: wRightSide())),
        ],
      ),
    );
  }
}

List<Widget> wLeftSide() {
  return [
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.amberAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.orange,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.purpleAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.blueGrey,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
  ];
}

List<Widget> wCenter() {
  return [
    Expanded(
      // flex: 2,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      Expanded(child: Container(
        color: Colors.greenAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),),
      Expanded(child: Container(
        color: Colors.redAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),),
      ],)
    ),
    Expanded(
      // flex: 4,
      child: Container(
        alignment: Alignment(-0.5, 0),
        color: Colors.white10,
        child: Text("Blank area", style: TextStyle(fontSize: 30.0),),
      ),
    ),
    Expanded(
      // flex: 2,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: [
      Expanded(child: Container(
        color: Colors.greenAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),),
      Expanded(child: Container(        
        color: Colors.redAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),),
      ],)
    ),
  ];
}

List<Widget> wRightSide() {
  return [
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.amberAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.orange,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.purpleAccent,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.blueGrey,
        child: Icon(Icons.circle_notifications, color: Colors.amber, size: 63),
      ),
    ),
  ];
}
