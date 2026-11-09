import 'package:flutter/material.dart';
import 'package:pokedexappapi/model/pokedex_model.dart';

class InfoPage extends StatefulWidget {
  final Pokemon pokemon;
  const InfoPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Info: ${widget.pokemon.name}",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
