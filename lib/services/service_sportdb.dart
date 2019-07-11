import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_parsing_json/model/model_sportdb.dart';

String url = "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League";

Future<TeamList> getSportDbList() async{
  var response = await http.get(url);
  print("getting response ...");
  print(response.body);
  var results = json.decode(response.body);
  TeamList sportDbList = TeamList.fromJson(results);
  print("Teams length : " + sportDbList.teams.length.toString());
  return sportDbList;
}