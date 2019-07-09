import 'package:belajar_parsing_json/model/model_comment.dart';
import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/services/services_post.dart';

class CommentUi extends StatefulWidget {
  @override
  _CommentUiState createState() => _CommentUiState();
}

class _CommentUiState extends State<CommentUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getCommentsFromJsonPlaceholder(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                itemCount: snapshot.data.comments.length,
                separatorBuilder: (context, index){
                  return Divider(
                    height: 10.0,
                    color: Colors.green,
                  );
                },
                itemBuilder: (context, index){
                  Comment comment = snapshot.data.comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(comment.id.toString()),
                    ),
                    title: Text(comment.name),
                    subtitle: Text(comment.email),
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
      ),
    );
  }
}