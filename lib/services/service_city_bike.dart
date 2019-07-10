import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_parsing_json/model/model_city_bike.dart';

String url = 'http://api.citybik.es/v2/networks';

Future<CityBikeList> getCityBikeList() async{
  var response = await http.get(url);
  var results = json.decode(response.body);
  CityBikeList cityBikeList = CityBikeList.fromJson(results);
  return cityBikeList;
}