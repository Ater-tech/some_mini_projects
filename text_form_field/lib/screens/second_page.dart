import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  const SecondPage({super.key});

  @override
  State<SecondPage> createState()=> _MainState();
}

class _MainState extends State<SecondPage>{
  final formKey = GlobalKey<FormState>();
  final controllerA = TextEditingController();
  final controllerB = TextEditingController();
  bool _isChecked = false;
  String name = "Ghost";
  Color _tileColor = Colors.transparent;
  @override
  Widget build(BuildContext context){
  return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 45),), 
                  textFormFieldA(),
                  checkBox(),
                  RadioListTile(
                    value: (v){
                      
                    }
                    
                    )
                  
                ],
              )
              )
              ),
        Expanded(
          child: Column(
            children: [
              Expanded(child: Text("Salom $name")),
              buttonRefresh()
            ],
          )),
        ],),
  );    
  }

  CheckboxListTile checkBox() {
    return CheckboxListTile(
                  title: Text("Chechbox value 1"),
                  tileColor: _tileColor,
                  value: _isChecked, 
                  onChanged: (v){
                  setState(() {
                    _isChecked = !_isChecked;
                    _tileColor = _tileColor == Colors.transparent
                    ?Colors.yellow
                    :Colors.transparent;
                  });
                });
  }

  Expanded buttonRefresh() {
    return Expanded(
              child: Center(
                child: ElevatedButton(onPressed: (){
                              setState(() {
                                name = controllerA.text;
                                controllerA.clear();
                              });
                              }, 
                      child: Text("Refresh")),
              ));
  }

  Padding textFormFieldA() {
    return Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
                  child: TextFormField(
                    controller: controllerA,
                    maxLines: 2,
                    maxLength: 10,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    
                    decoration: InputDecoration(
                      icon: Icon(Icons.verified_user),

                      labelText: "Write down here...",
                      hint: Text("@gmail.com"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                    ),
                    
                  ),
                );
  }
}