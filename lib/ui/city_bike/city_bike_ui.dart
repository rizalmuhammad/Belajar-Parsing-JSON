import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_city_bike.dart';
import 'package:belajar_parsing_json/services/service_city_bike.dart';

class CityBikeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getCityBikeList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.networks.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.teal,
                  height: 10.0,
                );
              },
              itemBuilder: (context, index) {
                Networks cityBikeNetwork = snapshot.data.networks[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(cityBikeNetwork.name[0]),
                  ),
                  title: Text(
                    cityBikeNetwork.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(cityBikeNetwork.location.city),
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
