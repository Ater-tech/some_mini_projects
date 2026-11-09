import 'dart:async';

import 'package:dispose_and_init/screens/helper.dart';
import 'package:flutter/material.dart';

class AwaitAndResume extends StatefulWidget{
  const AwaitAndResume({super.key});

  @override
  State<AwaitAndResume> createState()=> _StateAAR();
}

class _StateAAR extends State<AwaitAndResume>{
  Timer? time;
  int counter = 0;

  void startTime(){
    time = Timer.periodic(
      Duration(seconds: 1), 
     (t) => setState(() {
       counter++;
     })
     );
  }

  void pauseTime(){
    time!.cancel();
  }

  void resumeTime(){
    startTime();
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  void dispose(){
    time?.cancel();
    super.dispose();
  }

  Future<void> onTapFunc() async{
    pauseTime();
    await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=> Helper() 
        ));
    resumeTime();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(child: Text("Counter $counter"),),
            OutlinedButton(
              onPressed: ()=> onTapFunc(), 
              child: Text("Helper"))
          ],
        ),
      ),
      );
  }
}