import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:offline_app/models/tech_model.dart';

class GetTechnologies {
  Future<List<TechModel>> getData() async{
    final dio = Dio(
      BaseOptions(),
    );
    
    final response = await dio.get(dotenv.env['TECHNOLOGY_URL']??'',);
    if(response.statusCode == 200){
      final info = (response.data as List)
    .map((e)=>TechModel.fromJson(e))
    .toList();      
      return info;
    } else {
      throw Exception(response.statusMessage);
      
    }
    
  }
}