import 'package:flutter/foundation.dart';
import 'package:offline_app/models/local_model.dart';
import 'package:offline_app/service/get_technologies.dart';
import 'package:offline_app/service/storege_hive/data_hive.dart';

class TechRepository {
  final GetTechnologies dioService;
  final LocalData hiveService;

  TechRepository({
    required this.dioService,
    required this.hiveService,
  });

  Future<List<LocalModel>> getTech() async{
    final lData = await hiveService.readTech();    
    if(lData.isNotEmpty){
      await _refreshFromServer();
      return lData;
    }

    final responseOnline = await dioService.getData();
    final List<LocalModel> response = responseOnline.map(
      (e) => LocalModel(
        name: e.name, 
        price: e.price,
        isAviable: e.isAviable,
        currency: e.currency,
        )
    ).toList();

    await hiveService.writeTech(response);
    return response;
  }

  Future<void> _refreshFromServer() async{
    try{
      final responseOnline = await dioService.getData();
    final List<LocalModel> response = responseOnline.map(
      (e) => LocalModel(
        name: e.name, 
        price: e.price,
        isAviable: e.isAviable,
        currency: e.currency,
        )
    ).toList();

    await hiveService.writeTech(response);
    } catch(e){debugPrint(e.toString());}
  }
  Future<List<LocalModel>> refreshTech() async{
    final responseOnline = await dioService.getData();
    final List<LocalModel> response = responseOnline.map(
      (e) => LocalModel(
        name: e.name, 
        price: e.price,
        isAviable: e.isAviable,
        currency: e.currency,
        )
    ).toList();

    await hiveService.writeTech(response);
    return response;
  }
}