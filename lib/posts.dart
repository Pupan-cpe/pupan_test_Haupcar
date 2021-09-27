import 'package:flutter/material.dart';
import 'package:pupan_se/http_service.dart';
// import 'package:pupan_se/post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pupan"),
      ),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              List<dynamic> stringList = snapshot.data;
              return ListView(
                children: stringList
                    .map((dynamic stringList) => ListTile(
                          title: Text(stringList),
                        ))
                    .toList(),
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
