import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SubjectScrollMenu extends StatefulWidget{
  final String name;

  const SubjectScrollMenu({super.key, required this.name});

  @override
  State<SubjectScrollMenu> createState()=> _SubjectMenu();
}

class _SubjectMenu extends State<SubjectScrollMenu>{
  List<Subject> chaptersNameEng = [];
  List<Subject> chaptersNameUz = [];
  bool isEnglish = true;

  void changeLanguage(){
    setState(() {
      isEnglish =!isEnglish;
    });
  }

  @override
  void initState() {
    super.initState();
    readChapters();
  }

  Future<void> readChapters() async{
    final String phase1 =  "assets/data/eng/${widget.name.toLowerCase()}.json";
    final String phase2 =  "assets/data/uz/${widget.name.toLowerCase()}.json";

    String response = await rootBundle.loadString(phase1);
    final dataEng = await jsonDecode(response) as List;
    response = await rootBundle.loadString(phase2);
    final dataUz = await jsonDecode(response) as List;

    setState(() {
      chaptersNameEng = dataEng.map((json)=>Subject.fromJson(json)).toList();
      chaptersNameUz = dataUz.map((json)=>Subject.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.name.toUpperCase()),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            flexibleSpace: FlexibleSpaceBar(
              title: InkWell(onTap: () => chaptersDetailPage(context, chName: "More info"), child: Text("More info", style: TextStyle(fontSize: 9.0),),),
              background: Image.asset("assets/photos/${widget.name.toLowerCase()}.jpg", fit: BoxFit.cover,),
            ),
            expandedHeight: MediaQuery.of(context).size.height*0.4,
            pinned: true,
            floating: true,
            actions: [IconButton(onPressed:() => changeLanguage(), icon: Icon(Icons.language_rounded))],
          ),
          SliverList.builder(
            itemCount: isEnglish? chaptersNameEng.length : chaptersNameUz.length,
            itemBuilder: (context, index) {
              final subject = isEnglish? chaptersNameEng[index] : chaptersNameUz[index];
              final String name = subject.name; 
              return chapterSubjects(context, name: name);
              },
            ),
          
           
        ],
        ),
    );
  }
}

class Subject{
  final String name;
  final int id;

  const Subject({required this.name, required this.id});

  factory Subject.fromJson(Map<String, dynamic> json){
    return Subject(name: json['name'], id: json['id']);
  }
}

Widget chapterSubjects(BuildContext context, {required String name}){
  return InkWell(
    onTap: () => chaptersDetailPage(context, chName: name),
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.teal,
      child: Container(
        // decoration: BoxDecoration(color: Colors.blueAccent),
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(name, textAlign: TextAlign.center,)
        ),
    ),
  );
}

void chaptersDetailPage(BuildContext context, {required String chName}){
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text(chName, style: TextStyle(color: Colors.black54),),
      backgroundColor: Colors.white.withValues(alpha: 1),
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      content: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "Information about $chName", 
          style: TextStyle(color: Colors.black54),
          textAlign: TextAlign.justify,
          ),
      ),
      actions: [
        ElevatedButton(
          onPressed: ()=> Navigator.pop(context), 
          style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
          child: Text("Ok", style: TextStyle(color: Colors.black),),
          ),
        ElevatedButton(
          onPressed: ()=> Navigator.pop(context), 
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          child: Text("Cancel", style: TextStyle(color: Colors.black),),
          ),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
    ));
}