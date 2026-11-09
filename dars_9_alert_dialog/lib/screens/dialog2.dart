import 'package:flutter/material.dart';

void dialog2(BuildContext context) => showDialog(
  context: context, 
  builder: (context)=> Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white38.withValues(alpha: 1),
              borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Succsess!",
                  // style: Theme.of(context).textTheme.titleLarge,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    "The operation has done succsessly!",
                    style: TextStyle(color: Colors.black87),
                    textAlign: TextAlign.center,
                    ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                        Navigator.pop(context);
                      }, 
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent), 
                        child: Text("OK", style: TextStyle(color: Colors.white),)),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                      }, 
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                        child: Text("Cencel", style: TextStyle(color: Colors.white),)),
                    ],),
                ],
              
              ),
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.greenAccent,
            ),
            child: ClipOval(
              child: Image.asset("assets/photos/check.gif", fit: BoxFit.cover,),
            ),
          ),
        ],
      ),
    ),
  );