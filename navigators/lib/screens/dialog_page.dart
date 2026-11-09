import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget{
  const DialogPage({super.key});

  @override
  State<DialogPage> createState()=> _DialogPage();
}

class _DialogPage extends State<DialogPage>{
  @override
  Widget build(BuildContext context){
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if(didPop) return;
        final shouldPop = await showDialog<bool>(
          context: context, 
          builder: (conext) => AlertDialog(
            title: Text("chiqmoqchimisiz?"),
            content: Text("Chiqib ketishga amin bo'lsangiz bosing"),
            actions: [
              TextButton(
                onPressed: ()=> Navigator.pop(context, false),
                child: Text("Yo'q"),
              ),
              TextButton(
                onPressed: ()=> Navigator.pop(context, true),
                child: Text("Ha"),
              ),
            ],
          )  
          );
          if(shouldPop == true){
            Navigator.pop(!mounted?context:context, "Qaytayotgan malumot");
          }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Alert dialog"),),
        body: Center(child: Text("Context"),),
      ),

      );
  }
}


class User{
  String name;
  int age;
  String lastname;
  User({required this.name, required this.lastname, required this.age, });
}