import 'package:flutter/material.dart';
import 'package:offline_app/models/local_model.dart';
import 'package:offline_app/repository/tech_repository.dart';
import 'package:offline_app/service/get_technologies.dart';
import 'package:offline_app/service/storege_hive/data_hive.dart';

class HomeUI extends StatefulWidget{
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _StateTech(); 
}

class _StateTech extends State<HomeUI>{
  late final TechRepository techs;
  List<LocalModel> techList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    techs = TechRepository(
      dioService: GetTechnologies(), 
      hiveService: LocalData());    
    loadData();
  }
  

  Future<void> loadData() async{
    final data = await techs.getTech();
    setState(() {
      techList = data;
      isLoading = false;
    });
  }

  Future<void> refreshData() async{
    final data = await techs.refreshTech();
    setState(() {
      techList = data;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: barTitleButton(),
      body: isLoading
      ?Center(child: CircularProgressIndicator(),)
      :SizedBox(
        height: MediaQuery.sizeOf(context).height,
        
        child: ListView.builder(
          itemCount: techList.length,
          itemBuilder: (context, index)
          {
            final tech = techList[index];
            return ListTile(
              title: Text(tech.name??"None"),             
              subtitle: Row(
                children: [
                  Text(tech.price??"Null",),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(tech.currency??"?"),
                  ),
                ],
              ),
              trailing: tech.isAviable!?Icon(Icons.check):Icon(Icons.cancel_rounded),
              );
                }
              ),
      ),
    );
  }

  AppBar barTitleButton() => AppBar(
    title: Text("Technologies"), 
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: (){
          refreshData();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Yuklanmoqda..."),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.white.withValues(alpha: 0.18),
              )
          );
      }, 
      icon: Icon(Icons.refresh),)
    ],
    );
}