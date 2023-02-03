import 'package:kawin101api/pokemon_detail_screen.dart';
import 'package:kawin101api/pokemon_list_model.dart';
import 'package:kawin101api/pokemon_model.dart';
import 'package:kawin101api/pokemon_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Pokemon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PokemonService peopleservice = PokemonService();

  late PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: peopleservice.getPokemonList(),
          builder: (context, AsyncSnapshot<PokemonListModel> snapshot) {
            if (snapshot.hasData) {
              PokemonListModel lists = snapshot.data!;
              return ListView(
                children: lists.results!
                    .map((PokemonListitem e) => ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokemonDetailScreen(
                                          title: e.name!,
                                          url: e.url!,
                                        )));
                          },
                          title: Text(e.name!),
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )
        //This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
