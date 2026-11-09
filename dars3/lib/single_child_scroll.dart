import 'package:flutter/material.dart';

class SChScView extends StatelessWidget {
  SChScView({super.key});

  final List<Widget> myTextW = List.generate(
    30,
    (int index) =>
        ElevatedButton(onPressed: () {}, child: Text("Button $index")),
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> myTextW2 = List.generate(
      10,
      (int index) => Container(
        color: Colors.blueAccent,
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width,
        child: Text("Physics $index This words are to long, so maybe we can cut off....", 
        textAlign: TextAlign.center, ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Property Column & Row")),
      body: SingleChildScrollView(
        //padding: EdgeInsets.only(left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          textDirection: TextDirection.ltr, //! Row uchun
          verticalDirection: VerticalDirection.up,
          spacing: 5,
          children: myTextW2,
        ),
      ),
    );
  }
}
