import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedexappapi/model/pokedex_model.dart';
import 'package:pokedexappapi/service/pokedex_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PokedexModel? _pokedexes;
  @override
  void initState() {
    super.initState();
    ServicePokedex.getPokedex().then((value) {
      _pokedexes = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/search', arguments: _pokedexes);
          },
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: ServicePokedex.getPokedex(),
          builder: (context, AsyncSnapshot<PokedexModel> snap) {
            if (!snap.hasData) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snap.hasError) {
              return Center(
                child: Text("Error: ${snap.error}"),
              );
            } else {
              var data = snap.data!.pokemon;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Name: ${data![index].name}"),
                    subtitle: SizedBox(
                      height: 250,
                      child: CachedNetworkImage(
                        imageUrl: data[index].img!,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/settings',
                        arguments: data[index],
                      );
                    },
                  );
                },
                itemCount: data!.length,
              );
            }
          },
        ),
      ),
    );
  }
}
