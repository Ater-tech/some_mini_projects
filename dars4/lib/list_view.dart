import 'package:flutter/material.dart';

class LstV extends StatelessWidget{
  LstV({super.key});
  final List<Widget> widgets = List.generate(
    30, (index) {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/x400"),
          ),
          title: Text("Allan Jordan"),
          subtitle: Text("15:07"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ),
        const Divider(height: 1.0,),
      ],);
    } 
    );
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
      body: ListView(
        scrollDirection: Axis.vertical, 
        children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://random.imagecdn.app/500/500"),
            onBackgroundImageError: (exception, stackTrace) => Image(image: AssetImage("assets/images/downloading.gif")),
            
          ),
          title: Text("Allan Jordan"),
          subtitle: Text("15:07"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ),
        const Divider(height: 1.0,), 
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://random.imagecdn.app/500/500"),
            onBackgroundImageError: (exception, stackTrace) => Image(image: AssetImage("assets/images/downloading.gif")),
            
          ),
          title: Text("Allan Jordan"),
          subtitle: Text("15:07"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ),
        const Divider(height: 1.0,), 
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://random.imagecdn.app/500/500"),
            onBackgroundImageError: (exception, stackTrace) => Image(image: AssetImage("assets/images/downloading.gif")),
            
          ),
          title: Text("Allan Jordan"),
          subtitle: Text("15:07"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ),
        const Divider(height: 1.0,), 
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://random.imagecdn.app/500/500"),
            onBackgroundImageError: (exception, stackTrace) => Image(image: AssetImage("assets/images/downloading.gif")),
            
          ),
          title: Text("Allan Jordan"),
          subtitle: Text("15:07"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ),
        const Divider(height: 1.0,), 
        
        ],
      ),
      );
  }
}