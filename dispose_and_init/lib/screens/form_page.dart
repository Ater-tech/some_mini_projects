// import 'dart:async';
import 'package:dispose_and_init/screens/method_page.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget{
  const FormPage({super.key});

  @override
  State<FormPage> createState()=> _StateForm();
}

class _StateForm extends State<FormPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Disposse Method"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("press the button above to back!"),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context)=>MethodPage())
                  ), 
              child: Text("Back"))
            ]),
        
      ),
    );
  }
}