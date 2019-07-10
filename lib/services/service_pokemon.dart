import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_parsing_json/model/model_pokemon.dart';

String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

Future<PokemonList> getPokemon() async{
  var response = await http.get(url);
  print("getting response ...");
  print(response.body);
  var results = json.decode(response.body);
  PokemonList pokemonList = PokemonList.fromJson(results);
  print("Pokemon length : " + pokemonList.pokemon.length.toString());
  return pokemonList;
}