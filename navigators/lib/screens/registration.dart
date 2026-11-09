import 'package:flutter/material.dart';

class Registration extends StatefulWidget{
  const Registration({super.key});

  @override
  State<Registration> createState()=> _StateReg();
}

class _StateReg extends State<Registration>{
  final TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Registration"),),
      body: Container(
          height: MediaQuery.sizeOf(context).height, 
          width: double.infinity,
          color: Colors.grey[100],
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.circular(12),
                  ),                
                margin: EdgeInsets.all(12),
                child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Ismingizni kiriting:",
                ),
                            ),
              ),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () => Navigator.pop(context, controller.text), 
              child: Text("Saqlash"),
              )
            ]
          ),
          ),
    );
  }
}