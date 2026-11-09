import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_app/models/local_model.dart';
import 'package:path_provider/path_provider.dart';

class LocalData {
  String boxName = "Technology";
  Box? box;

  Future<Box> openB() async{
    Directory appDocDir = await getApplicationCacheDirectory();
    Hive.init(appDocDir.path);     
    return await Hive.openBox(boxName);    
  }

  Future<List<LocalModel>> readTech() async{
    final box = await openB();
    final data = await box.get("tech", defaultValue: List<LocalModel>);
    return List<LocalModel>.from(data);
  }
  

  Future<void> writeTech(List<LocalModel> techs) async{
    final box = await openB();
    await box.put("tech", techs);
  }
  
}