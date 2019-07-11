import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/ui/random_user/random_user_ui.dart';
import 'package:belajar_parsing_json/ui/json_placeholder/placeholder_ui.dart';
import 'package:belajar_parsing_json/ui/pokemon/pokemon_ui.dart';
import 'package:belajar_parsing_json/ui/city_bike/city_bike_ui.dart';
import 'package:belajar_parsing_json/ui/sportdb/sportdb_ui.dart';

class ApiEndPointPage extends StatefulWidget {
  final String appBarTitle;

  ApiEndPointPage({this.appBarTitle});

  @override
  _ApiEndPointPageState createState() => _ApiEndPointPageState();
}

class _ApiEndPointPageState extends State<ApiEndPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: buildBody(widget.appBarTitle),
    );
  }

  Widget buildBody(String title) {
    switch (title) {
      case "JSON placeholder":
        return PlaceholderUi();
      case "Random User":
        return RandomUserUi();
      case "Pokemon":
        return PokemonUi();
      case "City Bike":
        return CityBikeUi();
      case "SportDB":
        return SportdbUi();
    }
  }
}
