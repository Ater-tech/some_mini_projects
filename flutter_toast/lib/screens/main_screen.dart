import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'toast_servise.dart';
import 'diolog_with_user.dart';

class AppHome extends StatefulWidget{
  const AppHome({super.key});
  
  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome>{

  final List<String> name = ["Anora", "Ali", "AvaMax", "Bruse", "Itachi", "Gone"];

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    ToastServise.init(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(      
      appBar: AppBar(
        title: Text("Flutter Toast", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.cyan,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.white,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.question_answer), color: Colors.white,),
          IconButton(onPressed: (){
            return helpMenu(context, name: "User");
          },
          color: Colors.white, 
          icon: Icon(Icons.help),),
        ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Stack(
                  children: [
                      InkWell(
                        onDoubleTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.black.withValues(alpha: 0.5), 
                              content: Text("Liked", textAlign: TextAlign.center,)));
                              },
                        onTap: (){
                          ToastServise.show("Yo'naltirildi", position: ToastGravity.CENTER);
                          },
                        child: Image.network(
                          "https://picsum.photos/800/800?random=$index", 
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height*.7,
                          // color: Colors.blueGrey,
                          ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,                      
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.35),                          
                          child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage('https://picsum.photos/200/200?random=$index'),), 
                          title: Text(name[index], style: TextStyle(color: Colors.white),),
                          subtitle: Text("information about ${name[index]}", style: TextStyle(color: Colors.white70),),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert), color: Colors.white,),
                          ),
                        ))
                      ]),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  
                  // color: Colors.black.withValues(alpha: 0.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){return ToastServise.show("Liked by ${name[index]}", position: ToastGravity.CENTER);}, icon: Icon(Icons.favorite_border),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                      IconButton(onPressed: (){shareWithOther(context, name: name[index]);}, icon: Icon(Icons.share)),
                      IconButton(onPressed: (){return ToastServise.show("Added to favourite", position: ToastGravity.CENTER);}, icon: Icon(Icons.bookmark_border))
                  ],),
                ),
                ]),
              ),
              itemCount: name.length,
            ),
    );
  }
}