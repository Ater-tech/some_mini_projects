import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_go/offlineDB/pokemons_local_model.dart';
import 'package:pokemon_go/screens/main_page/routes/app_routes.dart';
import 'package:pokemon_go/service/hive_box_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonsLocalModelAdapter());
  await Hive.openBox<PokemonsLocalModel>(HiveBoxService.boxName);  
  await dotenv.load(fileName: ".env");
  runApp(PokemonGo());
}

class PokemonGo extends StatelessWidget{
  const PokemonGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}