import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Chapters extends StatefulWidget {
  final String name;
  const Chapters({super.key, required this.name});

  @override
  State<Chapters> createState() => _Chapters();
}

class _Chapters extends State<Chapters> {
  List<Subjets> subjectsEng = [];
  List<Subjets> subjectsUz = [];
  bool isEnglish = true;

  void changeLanguage() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSubjets();
  }

  Future<void> loadSubjets() async {
    final String phase1 = "assets/data/eng/${widget.name.toLowerCase()}.json"; 
    final String phase2 = "assets/data/uz/${widget.name.toLowerCase()}.json"; 
    String response = await rootBundle.loadString(phase1);
    final dataEng = await jsonDecode(response) as List;
    response = await rootBundle.loadString(phase2);
    final dataUz = await jsonDecode(response) as List;

    setState(() {
      subjectsEng = dataEng.map((json) => Subjets.fromJson(json)).toList();
      subjectsUz = dataUz.map((json) => Subjets.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFDDD0),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(isEnglish ? "Topics" : "Mavzular"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              changeLanguage();
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final subject = isEnglish ? subjectsEng[index] : subjectsUz[index];
            final name = subject.nameChapters;

            return InkWell(
              onTap: () => chaptersDetailPage(context, chapterName: name),
              child: switch(widget.name){
                  "Math" => containerMath(name: name),
                  "Physics"=> containerPhysics(name: name, subjectName: widget.name),
                  "Biology" => containerPhysics(name: name, subjectName: widget.name),
                  "Chemistry" => containerPhysics(name: name, subjectName: widget.name),
              _=> SizedBox(),
              }
            );
          },
          itemCount: isEnglish ? subjectsEng.length : subjectsUz.length,
        ),
      ),
    );
  }
}

Widget containerMath({required String name}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueAccent.shade400,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Expanded(
          child: Image.asset("assets/photos/math.jpg", fit: BoxFit.cover),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget containerPhysics({required String name, required String subjectName}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(12),
    ),
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.shade400,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.redAccent, width: 1.0),
              image: DecorationImage(
                image: AssetImage("assets/photos/${subjectName.toLowerCase()}.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 2),
        Expanded(
          flex: 3,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ],
    ),
  );
}

class Subjets {
  final int id;
  final String nameChapters;

  Subjets({required this.id, required this.nameChapters});

  factory Subjets.fromJson(Map<String, dynamic> json) {
    return Subjets(id: json['id'], nameChapters: json['name']);
  }
}

void chaptersDetailPage(BuildContext context, {required String chapterName}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        chapterName,
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: Colors.white,
      content: Container(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 40),
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Text(
            "Information about $chapterName",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
          child: Text("Ok", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          child: Text("Cencel", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
