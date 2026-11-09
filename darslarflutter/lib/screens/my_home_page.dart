import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workwithapi/models/user_model.dart';
import 'package:workwithapi/service/user_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work With Api"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder(
          future: ServiceUser.getUsers(),
          builder: (context, AsyncSnapshot<List<UserModel>> snap) {
            if (!snap.hasData) {
              return Platform.isAndroid
                  ? const CircularProgressIndicator()
                  : const CupertinoActivityIndicator(
                      radius: 33.0,
                    );
            } else if (snap.hasError) {
              return const Center(
                child: Text("XATO BOR"),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(snap.data![index].name.toString());
                },
                itemCount: snap.data!.length,
              );
            }
          },
        ),
      ),
    );
  }
}
