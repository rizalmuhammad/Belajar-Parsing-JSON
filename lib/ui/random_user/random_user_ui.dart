import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_random_user.dart';
import 'package:belajar_parsing_json/services/service_random_user.dart';
import 'package:belajar_parsing_json/ui/random_user/random_user_profile.dart';

class RandomUserUi extends StatefulWidget {
  @override
  _RandomUserUiState createState() => _RandomUserUiState();
}

class _RandomUserUiState extends State<RandomUserUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getRandomUser(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snapshot.data.results.length,
              separatorBuilder: (context, index){
                return Divider(
                  height: 10.0,
                  color: Colors.green,
                );
              },
              itemBuilder: (context, index){
                Results results = snapshot.data.results[index];
                return ListTile(
                  leading: ClipOval(
                    child: Image.network(results.picture.thumbnail),
                  ),
                  title: Text(results.name.first + " " + results.name.last),
                  subtitle: Text(results.email),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return RandomUserProfile(
                          results: results,
                        );
                      }
                    ));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}