import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonDetailScreen({
    required this.title,
    required this.url,
  });
  String title;
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Name :' + this.title),
        ),
        //
        body: Center(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
              Text("Name: " + this.title),
              Text("url: " + this.url),
            ]))));
  }
}
