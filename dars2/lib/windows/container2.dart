import 'package:flutter/material.dart';

class Cont2 extends StatelessWidget {
  const Cont2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container2"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        spacing: 4,
        children: [
          Expanded(
            child: Row(
              children: [
                myWindow(
                  context: context,
                  myColor: Colors.pinkAccent,
                  myText:
                      "Fizika fani boshlangich tushunchalarini albatta klassik fizika beradi",
                ),
                myWindow(
                  context: context,
                  myColor: Colors.blueAccent,
                  myText: "Fizika elektr bolimi boshlangich tushunchalari",                  
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                myWindow(
                  context: context,
                  myText:
                      "Gauss teoremasiga ko'ra elektr maydon kuchlanganligi aniqlanadi",
                  myColor: Colors.amberAccent
                ),
                myWindow(
                  context: context,
                  myColor: Color.fromARGB(16, 158, 122, 179),
                  myText:
                      "Gauss teoremasi eng qiyin va eng ajoyib teoremadir",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Expanded myWindow({
  Key? thisKey,
  required BuildContext context,
  String? myText,
  Color? myColor,
}) {
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(10),
      color: myColor!,
      alignment: Alignment.centerLeft,
      child: Text(myText!),
    ),
  );
}
