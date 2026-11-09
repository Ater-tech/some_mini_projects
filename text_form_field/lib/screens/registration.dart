import 'package:flutter/material.dart';
import 'package:text_form_field/data/users_data.dart';

class Registration extends StatelessWidget{
  final int id;
  const Registration({super.key, required this.id});

  
  @override
  Widget build(BuildContext context) {
    final contrName = TextEditingController();
    final contrSureName = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("We can try there many text forms")
        ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: contrName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "This must be write...",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              validator: (v){
                if(v == null || v.isEmpty){
                  return "Empty!";
                }
                return null; 
              },
            // onSaved: (v){name = v!;},
            ),
            TextFormField(
              controller: contrSureName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Second Name",
                hintText: "Second name  write there",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              validator: (v){
                if(v == null || v.isEmpty){
                  return "Empty!";
                }
                return null; 
              },
            // onSaved: (v){sname = v!;},
            ),
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  debugPrint("I am worked");
                  final User user = User(firstName: contrName.text, secondName: contrSureName.text, id: id);
                  Navigator.pop(context, user);
                }
              }, 
              child: Text("Submit"))
          ],
                    ),
        ),
      ),

    );
  }
}