import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_app/models/local_model.dart';
import 'package:offline_app/screens/homeui.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  Hive.registerAdapter(LocalModelAdapter());
  await dotenv.load(fileName: '.env');
  runApp(OfflineApp());
}

class OfflineApp extends StatelessWidget{  
  const OfflineApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(),
    );
  }
}