import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_pokemon.dart';

class PokemonProfile extends StatefulWidget {
  Pokemon pokemon;

  PokemonProfile({this.pokemon});

  @override
  _PokemonProfileState createState() => _PokemonProfileState();
}

class _PokemonProfileState extends State<PokemonProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            child: Center(
              child: Hero(
                tag: widget.pokemon.img,
                child: Image.network(widget.pokemon.img),
              ),
            ),
          )
        ],
      ),
    );
  }
}