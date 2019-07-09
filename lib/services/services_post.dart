import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_parsing_json/model/model_comment.dart';
import 'package:belajar_parsing_json/model/model_post.dart';

String url = "https://jsonplaceholder.typicode.com/posts";
String commentUrl = "https://jsonplaceholder.typicode.com/posts/1/comments";

Future<PostList> getPostsFromJsonPlaceholder() async{
  var response = await http.get(url);
  var jsonResponse = json.decode(response.body);
  PostList postList = PostList.fromJson(jsonResponse);
  return postList;
}

Future<CommentList> getCommentsFromJsonPlaceholder() async{
  var response = await http.get(commentUrl);
  var jsonResponse = json.decode(response.body);
  CommentList commentList = CommentList.fromJson(jsonResponse);
  return commentList;
}