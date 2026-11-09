import 'package:flutter/material.dart';

class FormTextFlutter extends StatefulWidget{
  const FormTextFlutter({super.key});

  @override
  State<FormTextFlutter> createState()=> _State();
}

class _State extends State<FormTextFlutter>{
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String name = "Ghost";
  String status = "Not changed";
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1, 
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              color: Colors.white,
              child: myTextForm(_formKey),
            )),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amberAccent[400],
              child: statusName(name, status),
                ),
            ),
        ],
      ),
    floatingActionButton: myFAB(context),
    );
  }

  FloatingActionButton myFAB(BuildContext context){
    return FloatingActionButton(
      onPressed: (){
        if(_formKey.currentState!.validate()){
          setState(() {
            name = _textController.text;
            status = "checked!";
          });
        }
          _textController.clear();
      },
      child: Icon(Icons.check),
      );
  }

  Form myTextForm(Key? formKey){
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _textController,
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
              icon: Icon(Icons.add),
              labelText: "Name",
              hintText: "Type here",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo, width: 3)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              )
            ),
            validator: (value) {
              if(value!.isNotEmpty){
                return "Nothing have wrote";
              }else{
                return "Ok";
              }
            },
          ),
        ],
      )
      );
  }

  Center statusName(String name, String status){
    return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ), 
                    child: Center(child: Text("Name: $name"))),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(12),
                    ), 
                    child: Center(child: Text("Name: $status"))),
                ],
                  ),
                );
  } 
}