import 'package:flutter/material.dart';

class AdList extends StatefulWidget{
  const AdList({super.key});

  @override
  State<AdList> createState() => _AdList();
}

class _AdList extends State<AdList>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview with Ad"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.info)),
          IconButton(onPressed: (){}, icon: Icon(Icons.help)),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => index%4 == 0 
        ? ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/200/200?random=$index", headers: {"Rasm":"first"}),
          ),
          title: Text("Adversitement"),
        ):
        Divider(),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text("${index+1} name"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
        itemCount: 15,),
        
    );

  }
}