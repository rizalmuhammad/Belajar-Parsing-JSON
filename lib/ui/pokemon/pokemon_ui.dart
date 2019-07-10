import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_pokemon.dart';
import 'package:belajar_parsing_json/services/service_pokemon.dart';
import 'package:belajar_parsing_json/ui/pokemon/pokemon_profile.dart';

class PokemonUi extends StatefulWidget {
  @override
  _PokemonUiState createState() => _PokemonUiState();
}

class _PokemonUiState extends State<PokemonUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPokemon(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.pokemon.length,
              itemBuilder: (context, index){
                Pokemon pokemon = snapshot.data.pokemon[index];
                return ListTile(
                  leading: Hero(
                    tag: pokemon.img,
                    child: CircleAvatar(
                      child: Image.network(pokemon.img),
                    ),
                  ),
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.egg),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return PokemonProfile(pokemon: pokemon);
                      }
                    ));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}