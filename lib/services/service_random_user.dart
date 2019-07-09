import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_parsing_json/model/model_random_user.dart';

String url = "https://randomuser.me/api/?results=10";

Future<RandomUser> getRandomUser() async{
  var response = await http.get(url);
  var result = json.decode(response.body);
  RandomUser randomUser = RandomUser.fromJson(result);
  return randomUser;
}