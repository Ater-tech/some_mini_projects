import 'package:flutter/material.dart';

Future<String?> dioalogUser(BuildContext context) async {
  
  return await showDialog<String>(
    context: context,
    barrierDismissible: false, 
    builder: (dialogContext) {
      TextEditingController controller = TextEditingController();
      return PopScope(
        canPop: false,
        child: Dialog(
          child: SingleChildScrollView(
            child: Column(              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                controller: controller,
                decoration: InputDecoration(labelText: "Name",),                
              ),
              OutlinedButton(
                onPressed: (){
                  if(controller.text.isNotEmpty){
                    Navigator.pop(dialogContext, controller.text);
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Name kiriting!!!"), 
                        duration: Duration(milliseconds: 500),
                        ),
                        );
                  }

                }, 
                child: Text("Ok")) 
              ],
            ),
          ),
      )
      );
    }
    );
}