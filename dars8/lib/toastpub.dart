import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastPub extends StatefulWidget{
  const ToastPub({super.key});

  @override
  State<ToastPub> createState() => _ToastPub();
}

class _ToastPub extends State<ToastPub>{
  final List<String> names = ["Alex", "Max", "Lily", "Adam", "Nina"];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("FlutterToast"), backgroundColor: Colors.cyanAccent,),
      body: ListView.builder(
        itemBuilder: (context, index)=> SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*.7,
          child: Column(children: [
            Expanded(
            flex: 9, 
            child: Stack(
              fit: StackFit.expand,
              children: [
              InkWell(
              onTap: ()=> Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 1,
                msg: "You followed!",
                gravity: ToastGravity.CENTER,
                textColor: Colors.white,
                backgroundColor: Colors.blueAccent.withValues(alpha: 0.9),
              ),
              child: Image.network("https://picsum.photos/1200/1200/?random=$index", fit: BoxFit.cover,),
              ),
              Positioned(
                // left: MediaQuery.of(context).size.width*.01,            
                child: IgnorePointer(
                  ignoring: true,
                  child: ListTile(                  
                    leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu, color:Colors.white),),
                    title: Text(names[index], style: TextStyle(color: Colors.white, fontSize: 20.0),),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.abc_sharp, color: Colors.white,)),
                  ),
                ),
                ),  
              ],
            ),
              ),
            Expanded(flex: 1, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [
              IconButton(onPressed: (){Fluttertoast.showToast(
                msg: "Liked", 
                gravity: ToastGravity.BOTTOM_LEFT,
                backgroundColor: Colors.blueAccent.withValues(alpha: 0.8),
                textColor: Colors.white,
                );
                }, 
                icon: Icon(Icons.favorite_border_outlined),
                ),
              IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline)),
              IconButton(onPressed: (){}, icon: Icon(Icons.share)),                
              ],),
              IconButton(onPressed: (){}, icon: Icon(Icons.info))
            ],)),
          ],),
        ),
        itemCount: names.length,
      ),
    );
  }
}