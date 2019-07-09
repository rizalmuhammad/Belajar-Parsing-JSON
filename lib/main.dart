import 'package:flutter/material.dart';
import 'package:belajar_parsing_json/model/model_api_list.dart';
import 'package:belajar_parsing_json/services/service_api_list.dart';
import 'package:belajar_parsing_json/ui/api_endpoints/api_endpoints.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Parsing JSON',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Belajar Parsing JSON'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<ApiList>(
        initialData: null,
        future: getApiList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              itemCount: snapshot.data.apiList.length,
              separatorBuilder: (context, index) => Divider(
                    color: Colors.green,
                    height: 10.0,
                  ),
              itemBuilder: (context, index) {
                Api api = snapshot.data.apiList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(api.index.toString()),
                  ),
                  title: Text(api.title),
                  subtitle: Text(api.url),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ApiEndPointPage(
                        appBarTitle: api.title,
                      );
                    }));
                  },
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
