import 'package:flutter/material.dart';

class LstVUserData extends StatelessWidget{
  LstVUserData({super.key});

  final List<UsersData> users = List.generate(15, (index) => UsersData(
    name: "User id: $index",
    age: index,
    backgr: (index+1).isEven? true : false,
  ));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(onPressed: (){}, child: Text(
          "Guest", 
          style: TextStyle(
            fontSize: 25,
            color: Colors.amberAccent), 
            ), 
            ),
        // backgroundColor: Colors.amber,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical, 
        itemBuilder: (context, index) => Card(
          color: users[index].backgr!? Colors.greenAccent: Colors.redAccent,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://random.imagecdn.app/400/400"),
            ),
            title: Text(users[index].name.toString()),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Age: ${users[index].age}"),
                Text("S: ${users[index].backgr!?"Male":"Female"}"),
              ],
            ),
            trailing: IconButton(
              hoverColor: Colors.amberAccent,
              splashColor: Colors.amberAccent,
              highlightColor: Colors.amberAccent,
              onPressed: (){}, 
              icon: Icon(Icons.arrow_forward_ios,
              
              )),
          ),
        ),
        itemCount: users.length,
      ),
      );
  }
}

class UsersData extends Object {
  String? name;
  int? age;
  bool? backgr;

  UsersData({this.name, this.age, this.backgr});


}