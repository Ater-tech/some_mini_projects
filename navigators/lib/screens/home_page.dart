import 'package:flutter/material.dart';
import 'package:navigators/pages_class/names.dart';
import 'package:navigators/screens/dialog_page.dart';
import 'package:navigators/screens/dialog_page_with_result.dart';
import 'registration.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  
  String nameUser = "Ghost";
  String info = "Qayta ishlanmagan!";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.question_answer_sharp)),
        title: Text("Navigation"),
        backgroundColor: Colors.amberAccent[200],
        actions: [alertButton(context)],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: header()), 
          
          SliverList.separated(
            itemBuilder: (context, index) => 
            myGestureDetector(context, index), 
            separatorBuilder: (context, index) => 
            sepratedBox(context),
            itemCount: pages.length,),          
          nameInfo(context),
        ],
      ),
      floatingActionButton: regFloatButton(),
    );
  }
  
  IconButton alertButton(BuildContext context){
    return IconButton.outlined(
      icon: Icon(Icons.app_registration),
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> DialogPage()), 
          );
      if(result != null){
        setState(() {
          info = result.toString();
        });
      }
   }
      );
  }

  SliverToBoxAdapter nameInfo(BuildContext context){
    String result = "!";
    return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 50),
          color: Colors.orangeAccent[100],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Salom $result"), 
                IconButton(
                  onPressed: () async {
                    final name = await dioalogUser(context);                    
                    setState(() {
                        result = name.toString();
                      });
                  }, 
                icon: Icon(Icons.change_circle_outlined))]),
              Text(info),
            ],
          ),
        ),
    );
  }

  SizedBox header(){
    return SizedBox(
            height: 80, 
            width: double.infinity, 
            child: Center(child: Text("Welcome $nameUser", style: TextStyle(fontSize: 20),)));
  }

  FloatingActionButton regFloatButton(){
    return FloatingActionButton(
      onPressed: () async {
        final result = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Registration()));
        
        if(result !=null){
          setState(() {
            nameUser = result.toString();
          });
        }
      },
      child: Icon(Icons.change_circle),
      );
  }

  SizedBox sepratedBox(BuildContext context) => SizedBox(height: MediaQuery.sizeOf(context).height*0.02,);

  GestureDetector myGestureDetector(BuildContext context, int index) {
    return GestureDetector(            
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20, 
                  child: Text(
                    "!", 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),), ),
                title: Text("Go to the ${pages[index].name}"),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            onTap: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> pages[index].page, 
               ),
            ).then((value)=> SnackBar(content: Text(value))),
    );
  }
}