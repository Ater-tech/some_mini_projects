import 'dart:async';

import 'package:dispose_and_init/screens/home_page.dart';
import 'package:flutter/material.dart';

class MethodPage extends StatefulWidget{
  const MethodPage({super.key});

  @override
  State<MethodPage> createState()=> _StateMP();
}

class _StateMP extends State<MethodPage>{
  late StreamSubscription contr;

  @override
  void initState(){
    super.initState();
    contr = myStream().listen(
      (data)=> debugPrint("item: $data")
      );
  }
  @override
  void dispose(){
    contr.cancel();
    super.dispose();
  }
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Ortga qaytish"),
          ElevatedButton(
            onPressed: ()=> Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> HomePage())), 
            child: Text("Ortga")),
        ],),
      ),
    );
  }
  
  Stream<int> myStream() async* {
      for(int i=0; i< 20; i++){
        await Future.delayed(Duration(seconds: 2), ()=>i);
        yield i;
      }
  }
}