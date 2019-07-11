import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_sportdb.dart';
import 'package:belajar_parsing_json/services/service_sportdb.dart';
import 'package:belajar_parsing_json/ui/sportdb/sportdb_profile.dart';

class SportdbUi extends StatefulWidget {
  @override
  _SportdbUiState createState() => _SportdbUiState();
}

class _SportdbUiState extends State<SportdbUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getSportDbList(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.teams.length,
              itemBuilder: (context, index){
                Teams teams = snapshot.data.teams[index];
                return ListTile(
                  leading: Hero(
                    tag: teams.strTeamBadge,
                    child: CircleAvatar(
                      child: Image.network(teams.strTeamBadge),
                    ),
                  ),
                  title: Text(teams.strTeam),
                  subtitle: Text(teams.strLeague),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return SportdbProfile(
                          teams: teams,
                        );
                      }
                    ));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}