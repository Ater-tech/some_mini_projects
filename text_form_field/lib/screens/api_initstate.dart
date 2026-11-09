import 'package:flutter/material.dart';
import 'package:text_form_field/data/service_user.dart';

class ApiInitstate extends StatefulWidget{
    const ApiInitstate({super.key});

    @override
    State<ApiInitstate> createState()=> _ApiState();
}

class _ApiState extends State<ApiInitstate>{
    List _userData = [];

    @override
    void initState(){
    super.initState();
    ServiceUser.getUserData().then((value){
    _userData = value;
    setState(() {
      
    });
    });
    }
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: _userData.isEmpty
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                    SliverAppBar(title: Text("User data init"),),
                    SliverList.builder(
                        itemBuilder: (context, index)=> Center(
                            child: Card(
                                child: ListTile(title: Text(_userData[index]['name']),),
                                    ),
                                ),
                            itemCount: _userData.length,
                            ),
                ],
            ),
        );
    }
}