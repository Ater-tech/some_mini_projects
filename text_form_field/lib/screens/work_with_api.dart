import 'package:flutter/material.dart';
import 'package:text_form_field/data/service_user.dart';

class WorkWithApi extends StatefulWidget{
  const WorkWithApi({super.key});

  @override
  State<WorkWithApi> createState()=> _WorkState();
}

class _WorkState extends State<WorkWithApi>{
  List _userData = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User data'), 
        centerTitle: true,
        ),
      body: Center(
        child: _userData.isEmpty
        ?CircularProgressIndicator()
        :ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(_userData[index]['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
          ),
          itemCount: _userData.length,
        ),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        _userData = await ServiceUser.getUserData();
        setState(() {
          
        });
    }, child: Icon(Icons.refresh),),
    );
  }
}