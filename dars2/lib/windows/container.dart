import 'package:flutter/material.dart';
import 'container2.dart';

class Cont extends StatelessWidget {
  const Cont({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey, 
        title: Text("Container"),
      ),
      body: Container(
        // height: 200,
        // width: 150,
        margin: EdgeInsetsDirectional.all(5),
        decoration: BoxDecoration(
          color: Colors.grey,
          //border: BoxBorder.all(color: Colors.red, width: 2, ),
        ),
        child: Column(children: [
          Container(
              height: 200,      
              //! color: Colors.greenAccent,
              decoration: BoxDecoration(
                //color: Colors.blueGrey,
                image: DecorationImage(image: AssetImage("assets/images/blue-2566082_1280.jpg"),
                 fit: BoxFit.cover),
              ),
          ),
          Container(
            height: 200,
            //! color: Colors.orangeAccent,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                "assets/images/fabric-316777_1280.jpg"), 
              fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 198,
            //color: Colors.lightGreenAccent,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                "assets/images/fashion-1979136_1280.jpg",
                ),
                fit: BoxFit.cover
                ),
            ),
          ),
        ],),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cont2()));
        },
        child: Icon(Icons.abc),
        ),
    );
  }
}
