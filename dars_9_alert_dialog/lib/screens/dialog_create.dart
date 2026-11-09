import 'package:dars_9_alert_dialog/screens/chapters.dart';
import 'package:flutter/material.dart';

void dialogCreate({
  required BuildContext context,
  required String titleSubject,
  required String infoSubject,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      // alignment: Alignment.center,
      // title: Text(titleSubject, style: TextStyle(color: Colors.black87,), textAlign: TextAlign.center,),
      content: Stack(
        alignment: AlignmentGeometry.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.fromLTRB(10, 60, 20, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFF8F8F8),
              ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    titleSubject,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    infoSubject,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.greenAccent,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage("assets/photos/check.gif"),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Chapters(name: titleSubject),               
                  ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Text(
                'Chapters',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      "You cliked Cencel",
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: Text(
                'Cencel',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
