// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ThisBoxDeco extends StatelessWidget{
  const ThisBoxDeco({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blueAccent,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d"), 
              fit: BoxFit.cover),
              borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(45)))
              // borderRadius: BorderRadius.only(
              //   bottomRight: Radius.elliptical(45, 65)
              //   ),
          ),
                  
        Container(          
          // height: MediaQuery.of(context).size.height*0.7,
          width: double.infinity,
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.elliptical(45, 65)),
            //color: Colors.blueAccent,  
              ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                primary: false,
                physics: BouncingScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            spacing: 20,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.120,
                  height: MediaQuery.of(context).size.height*0.120,                         
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  FadeInImage(
                    placeholder: AssetImage("assets/images/loading.webp"), 
                    image: NetworkImage("https://picsum.photos/400/600"), fit: BoxFit.cover,),),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.120,
                  height: MediaQuery.of(context).size.height*0.120,               
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/loading.webp"), 
                      image: NetworkImage(
                        "https://picsum.photos/600/900"), 
                        fit:BoxFit.cover,
                        ),
                  ),                
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.120,
                  height: MediaQuery.of(context).size.height*0.120,                
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/downloading.gif", ), 
                      image: NetworkImage("https://picsum.photos/200/300",),
                      fit: BoxFit.cover),
                  ),                
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.120,
                  height: MediaQuery.of(context).size.height*0.120,                
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/downloading.gif", ), 
                      image: NetworkImage("https://picsum.photos/200/300",),
                      fit: BoxFit.cover),
                  ),                
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height*0.120,
                  height: MediaQuery.of(context).size.height*0.120,                
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/downloading.gif", ), 
                      image: NetworkImage("https://picsum.photos/200/300",),
                      fit: BoxFit.cover),
                  ),                
                ),
                            ],
                          ),
              ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              width: MediaQuery.of(context).size.height*0.12,
              height: MediaQuery.of(context).size.height*0.12,
              decoration: BoxDecoration(
                color: Color(0xF8F8F8F8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlutterLogo(style: FlutterLogoStyle.stacked,),
            ),
            Container(
              width: MediaQuery.of(context).size.height*0.12,
              height: MediaQuery.of(context).size.height*0.12,
              decoration: BoxDecoration(
                color: Color(0xF8F8F8F8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: FlutterLogo(style: FlutterLogoStyle.horizontal,),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height*0.12,
              height: MediaQuery.of(context).size.height*0.12,              
              child: ClipRRect(                
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: AssetImage("assets/images/downloading.gif"), 
                  image: NetworkImage("https://images.pexels.com/photos/4238994/pexels-photo-4238994.jpeg"),
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          ],),
          ElevatedButton(
            onPressed: (){}, onLongPress: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent), child: Text("ElevatedButton")),
          TextButton(onPressed: (){}, child: Text("Text button")),
          OutlinedButton(onPressed: (){}, onLongPress: (){}, child: Text("OutlinedButton")),
          IconButton(onPressed:(){}, icon: Icon(Icons.import_contacts_rounded), color: Colors.blueAccent,),
          // CupertinoButton.tinted(child: Text("Cuper"), onPressed: (){}),
          OutlinedButton(onPressed: (){}, onLongPress: (){}, child: Text("OutlinedButton")),
          OutlinedButton(onPressed: (){}, onLongPress: (){}, child: Text("OutlinedButton")),
          OutlinedButton(onPressed: (){}, onLongPress: (){}, child: Text("OutlinedButton")),
          OutlinedButton(onPressed: (){}, onLongPress: (){}, child: Text("OutlinedButton")),
          ]),
        ),
      ],
    ),
    ),
    );
  }
}