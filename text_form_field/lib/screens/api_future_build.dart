import 'package:flutter/material.dart';
import 'package:text_form_field/data/service_user.dart';

class ApiFutureBuild extends StatefulWidget{
  const ApiFutureBuild({super.key});

  @override
  State<ApiFutureBuild> createState()=> _FutureState();
}

class _FutureState extends State<ApiFutureBuild>{
  late Future<dynamic> myData;
  
  @override
  void initState(){
    super.initState();
    myData = ServiceUser.getUserData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: myData,
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasError){
            return Center(child: Text("Xatolik!"));
          }

          final data = snapshot.data!;
          return CustomScrollView(
          slivers: [
            SliverAppBar(title: Text("UD future build"), centerTitle: true,),
            SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index)=> Card(
                child: ListTile(
                  title: Text(data[index]['name']),
                    ),
                  ),
                ),
          ],
        );
        }        
      ),
    );
  }
}