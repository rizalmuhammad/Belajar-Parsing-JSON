import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_sportdb.dart';

class SportdbProfile extends StatefulWidget {
  Teams teams;

  SportdbProfile({this.teams});
  
  @override
  _SportdbProfileState createState() => _SportdbProfileState();
}

class _SportdbProfileState extends State<SportdbProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teams.strTeam),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            child: Center(
              child: Hero(
                tag: widget.teams.strTeamLogo,
                child: Image.network(widget.teams.strTeamLogo),
              )
            ),
          )
        ],
      ),
    );
  }
}