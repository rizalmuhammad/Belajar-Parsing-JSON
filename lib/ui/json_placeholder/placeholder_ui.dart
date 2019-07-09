import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/ui/json_placeholder/post_ui.dart';
import 'package:belajar_parsing_json/ui/json_placeholder/comment_ui.dart';

class PlaceholderUi extends StatefulWidget {
  @override
  _PlaceholderUiState createState() => _PlaceholderUiState();
}

class _PlaceholderUiState extends State<PlaceholderUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("Posts"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return PostUi();
                }
              ));
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Comments"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return CommentUi();
                }
              ));
            },
          )
        ],
      ),
    );
  }
}
