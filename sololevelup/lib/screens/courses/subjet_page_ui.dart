import "package:flutter/material.dart";
import 'absolut_classes.dart';

class SubjectPage extends StatelessWidget{
  final AbsolutChapter subject;

  const SubjectPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            flexibleSpace: Image.asset(subject.imagePath, fit: BoxFit.cover,),            
          ),
          SliverList.builder(
            itemBuilder: (context, index) => Card(
              
              child: ExpansionTile(
                collapsedBackgroundColor: Colors.lightBlue[200],
                title: Text(subject.physicChapters[index].chaptersName),
                  children: List.generate(
                    subject.physicChapters[index].sectionsName.length, 
                    (int j) => Card(                      
                      margin: EdgeInsets.only(left: 20, top: 1.5, bottom: 3.5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [Colors.blueGrey, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        ),                      
                        child: ListTile(title: Text(subject.physicChapters[index].sectionsName[j])))))
                  ),
              ),
            itemCount: subject.physicChapters.length,
            ),
        ],
      ),
    );
  }
}