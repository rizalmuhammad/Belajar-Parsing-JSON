import 'dart:convert';
import 'package:belajar_parsing_json/model/model_api_list.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<ApiList> getApiList() async{
  var response = await rootBundle.loadString('assets/api_list.json');
  var jsonResponse = json.decode(response);
  ApiList apiList = ApiList.fromJson(jsonResponse);
  return apiList;
}