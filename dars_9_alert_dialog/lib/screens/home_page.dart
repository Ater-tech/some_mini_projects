import 'package:dars_9_alert_dialog/screens/dialog2.dart';
import 'package:dars_9_alert_dialog/screens/grid_view.dart';
import 'package:flutter/material.dart';
import 'dialog_create.dart';
// import 'dialog2.dart';

class HomePage extends StatefulWidget{
    const HomePage({super.key});

    @override
    State<HomePage> createState()=> _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin{
  final List<String> infoSubject = [
    "Mathematics is a field of study that discovers and organizes methods"
   "theories, and theorems that are developed and proved for the needs of empirical sciences" 
   "and mathematics itself. There are many areas of mathematics, which include number theory (the study of numbers),"
   " algebra (the study of formulas and related structures), geometry (the study of shapes and spaces that contain them),"
   " analysis (the study of continuous changes), and set theory (presently used as a foundation for all mathematics)."
  , 
  
  "Physics is the scientific study of matter, its fundamental constituents,"
  " its motion and behavior through space and time, and the related entities of energy and force."
  " It is one of the most fundamental scientific disciplines.A scientist who specializes in the field"
  " of physics is called a physicist.",
  "Biology is the scientific study of life and living organisms. It is a broad natural science that "
  "encompasses a wide range of fields and unifying principles that explain the structure, function,"
  " growth, origin, evolution, and distribution of life. Central to biology are five fundamental "
  "themes: the cell as the basic unit of life, genes and heredity as the basis of inheritance, "
  "evolution as the driver of biological diversity, energy transformation for sustaining life processes,"
  " and the maintenance of internal stability (homeostasis).",
  "Chemistry is the scientific study of the properties and behavior of matter."
  " It is a physical science within the natural sciences that studies the chemical elements"
  " that make up matter and compounds made of atoms, molecules and ions: their composition, "
  "structure, properties, behavior and the changes they undergo during reactions with other substances."
  " Chemistry also addresses the nature of chemical bonds in chemical compounds."
  ];

  static const List<String> nameSubjects = ["Math", "Physics", "Biology", "Chemistry"];
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(
      length: nameSubjects.length, 
      vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("My subjects", style:  TextStyle(color: Colors.white),),
        centerTitle: true, 
        backgroundColor: Colors.blue,
        actions: [          
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*.01),
            child: IconButton(onPressed: (){
              dialog2(context);
            }, 
            icon: Image.asset("assets/icons/question.png", width: 24, height: 24,)),
          )],
        bottom: TabBar(
          controller: _tabController,
          tabs: List.generate(nameSubjects.length, (index) => Tab(text: nameSubjects[index], icon: Icon(Icons.book_rounded),)),
        )
        ),
      body: TabBarView(
        controller: _tabController,
        clipBehavior: Clip.antiAlias,        
        children: List.generate(nameSubjects.length, (index) => myTabs(context: context, titleName: nameSubjects[index], infoSubject: infoSubject[index]))),   
    );
  }
}


Widget myTabs({required BuildContext context, required String titleName, required String infoSubject}){
  return 
      Container(
        color: Colors.cyanAccent.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[ 
              Container(
              padding: EdgeInsets.all(10),
              color: Colors.transparent,
              child: Text(infoSubject, textAlign: TextAlign.justify, style: TextStyle(color: Colors.black),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              OutlinedButton(
                onPressed: (){
                  dialogCreate(context: context, titleSubject: titleName, infoSubject: infoSubject);
              }, 
              style: OutlinedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: Text("More info", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
              ),
              OutlinedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectScrollMenu(name: titleName,)));
                      }, 
                style: OutlinedButton.styleFrom(backgroundColor: Colors.greenAccent), 
                child: Text("Ok", style: TextStyle(color: Colors.white),)
                ),
            ],)
            ]
          ),
      );
}