import 'package:flutter/material.dart';
import 'package:text_form_field/models/class_model.dart';
import 'package:text_form_field/models/user_data_model.dart';


class ClassModel extends StatefulWidget {
  const ClassModel({super.key});

  @override
  State<ClassModel> createState() => _FutureState();
}

class _FutureState extends State<ClassModel> {
  late Future<List<UserModel>> myData;

  @override
  void initState() {
    super.initState();
    myData = UserInfo.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: myData,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Xatolik! \n${snapshot.error.toString()}"));
          }

          final data = snapshot.data!;
          return CustomScrollView(
            slivers: [
              SliverAppBar(title: Text("UD future build"), centerTitle: true),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    Card(child: ListTile(
                      title: Text(data[index].name),
                      subtitle: Text(data[index].username),
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) =>
                        Dialog(
                          child: Container(
                            color: Colors.blueGrey.shade200,
                            width: 200,
                            height: 200,
                            child: Center(child: SingleChildScrollView(
                              child: Expanded(child: Column(
                                children: [
                                  Text("Info:"),
                                  Text(data[index].email, selectionColor: Colors.blue,),
                                  Text(data[index].phone),
                                  Text(data[index].address.city),
                                ],
                              )),)
                              ),
                          ),
                        ),
                      ),
                        ),
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
