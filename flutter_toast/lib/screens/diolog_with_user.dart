import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'toast_servise.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void helpMenu(BuildContext context, {required String name}){
  showDialog(
    context: context, 
    builder: (context)=> AlertDialog(
      title: Text("HELP for $name"),
      content: Text("Online yordam uchun Ok tugmasini bosing. "
      "Dasturimiz yaratuvchilari siz tomonidan bildiriladigan har qanday fikr"
      " va mulohazalardan mamnun!",
      textAlign: TextAlign.justify,),
      backgroundColor: Colors.white54.withValues(alpha: 0.5),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
          ElevatedButton(
          onPressed: ()=> {ToastServise.show("Bajarildi. Sizni saytga yo'naltirldi", position: ToastGravity.BOTTOM), Navigator.pop(context),}, 
          style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent), 
          child: Text("Ok", style: TextStyle(color: Colors.black),), ),
        TextButton(
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Rad etildi"),
              duration: Duration(seconds: 1),
              ),
          ); 
          Navigator.pop(context);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          child: Text("Cancel", style: TextStyle(color: Colors.black),
          ),
          ),
          ])
      ],
    ));
}

void shareWithOther(BuildContext context, {required String name}){
    final List<String> mediaNames = ["Telegram", "Reddit", "Google", "Instagram"];
  AwesomeDialog(
    context: context, 
    dialogType: DialogType.info,
    animType: AnimType.scale,
    body: SizedBox(
      height: MediaQuery.of(context).size.height*0.4,
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.share),
          title: OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){}, 
            child: Text(mediaNames[index])),
        ),
        itemCount: mediaNames.length,
        ),
    ),
    title: "Share it",
    desc: "Click it to share",
    btnOk: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
      onPressed: (){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Done!", style: TextStyle(), textAlign: TextAlign.center,), backgroundColor: Colors.black.withValues(alpha: 0.5), duration: Duration(seconds: 1),)
        );
      }, 
      child: Text("Ok")),
    btnCancel: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      onPressed: (){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Cancelled", textAlign: TextAlign.center,), duration: Duration(seconds: 1), backgroundColor: Colors.black.withValues(alpha: 0.5),)
          );
    }, 
    child: Text("Cancel")),
    ).show();
}