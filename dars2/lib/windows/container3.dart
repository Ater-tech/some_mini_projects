import 'package:flutter/material.dart';

class ExtraProperty extends StatelessWidget {
  const ExtraProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extra Properties"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image1.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius:BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),          
            constraints: BoxConstraints(minHeight: 40, minWidth: 100, maxHeight: 200, maxWidth: 400),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            transform: Matrix4.rotationZ(1/2),
            // foregroundDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(40),
            //   color: Colors.amber,
            //   ),
            child: Text(
              "Marvel",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Momo',
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent,
                //backgroundColor: Colors.blueGrey,                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
