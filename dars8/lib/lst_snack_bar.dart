import 'dart:math';

import 'package:flutter/material.dart';

class LstSnackBar extends StatefulWidget{
  const LstSnackBar({super.key}) ;
  
  @override
  State<LstSnackBar> createState()=> _LstSnackBar();
}

class _LstSnackBar extends State<LstSnackBar>{
  static const List<Color> listColors = [Colors.yellow, Colors.cyan, Colors.blue, Colors.redAccent, Colors.purple];
  
  List a = List.generate(30, (i) => [i+1, Random().nextInt(listColors.length)]);
  List? b = [];

  void removeItemList(List x){
      setState(() {
        a.remove(x);
      });
  }

  void addToList(List x){
      setState(() {
        int i = 0;
        while(i < a.length){
          if((a[i][0] > x[0])){a.insert(i, x); break;}
          if(i+1 == a.length){a.add(x);break;}            
          i++;
          }
      });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("SnackBar"), backgroundColor: Colors.transparent,),
      body: ListView.builder(
        itemBuilder:(context, index) => InkWell(
          onTap: (){
            b = a[index];
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${b![0]} Item removed!"),
                    TextButton(
                      onPressed: (){
                        return addToList(b!);
                      }, 
                      child: Text("Undo"))
                    ]),                
                duration: Duration(seconds: 2),
                dismissDirection: DismissDirection.horizontal, 
                backgroundColor: Colors.transparent,
                elevation: 4,
                // action: SnackBarAction(label: "Cencel", onPressed: (){return addToList(b!);}),
              ),
            );
            removeItemList(b!);
          },
          child: Container(
              margin: EdgeInsets.only(top: 10.0), 
              height: MediaQuery.of(context).size.height*0.2,
              color: listColors[a[index][1]],
              child: Center(
                  child: Text("${a[index][0]}", style: TextStyle(fontSize: 33.0),),
              ),
          ),
        ),
        itemCount: a.length,
        )
    );
  }
}