import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_post.dart';
import 'package:belajar_parsing_json/services/services_post.dart';

class PostUi extends StatefulWidget {
  @override
  _PostUiState createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: getPostsFromJsonPlaceholder(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snapshot.data.posts.length,
              separatorBuilder: (context, index){
                return Divider(
                  height: 10.0,
                  color: Colors.green,
                );
              },
              itemBuilder: (context, index){
                Post post = snapshot.data.posts[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(post.id.toString()),
                  ),
                  title: Text(post.title),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}