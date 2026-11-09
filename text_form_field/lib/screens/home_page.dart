import 'package:flutter/material.dart';
import 'package:text_form_field/data/users_data.dart';
import 'package:text_form_field/screens/api_future_build.dart';
import 'package:text_form_field/screens/api_initstate.dart';
import 'package:text_form_field/screens/chose_methods.dart';
import 'package:text_form_field/screens/class_model_ui.dart';
import 'package:text_form_field/screens/registration.dart';
import 'package:text_form_field/screens/second_page.dart';
import 'package:text_form_field/screens/work_with_api.dart';

class HomePage extends StatefulWidget{
 const HomePage({super.key});

 @override
 State<HomePage> createState()=> _State(); 
}

class _State extends State<HomePage>{
  List<User> users = [];
  int id = 1000;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Users info"),
        centerTitle: true,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userInfo(),
            registrUser(context),
          ],
        ),
      ),
    );
  }

  Expanded registrUser(BuildContext context) {
    return Expanded(
        flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            final user =  await
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> Registration(id: id,)),
                            );
                            if(user != null){
                              setState(() {
                                users.add(user);
                                id++;
                              });
                            }
                            },
                          child: Text("Registration")),
                      ),
                      Center(
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context)=> SecondPage()
                              )
                              );
                        }, 
                        child: Text("Second page"))
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChoseMethods()));
                        }, child: Text("Chose Methods")),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> WorkWithApi()));
                      }, child: Text("API with button")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> ApiInitstate())
                        );
                    }, 
                    child: Text("API initState")),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> ApiFutureBuild())
                        );
                    }, 
                    child: Text("API Future.build")),
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context)=>ClassModel())
                          );
                      }, 
                      child: Text("Class model")),
                      ElevatedButton(onPressed: (){}, child: Text("Classes")),
                    ],
                  ),
                ],
              ),
            )
            );
  }

  Expanded userInfo() {
    return Expanded(
            flex: 7,
            child: SizedBox(
              child: Container(
                color: Colors.transparent,
                child: ListView.builder(
                  itemBuilder: (context, index)=> Card(
                    child: ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text("User: ${users[index].firstName}  ${users[index].secondName}"),
                      subtitle: Text("ID: ${users[index].id}"),
                    ),
                  ),
                  itemCount: users.length,                  
                  ),
              ),
            ));
  }
}


