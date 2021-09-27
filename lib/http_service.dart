import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
// import 'package:pupan_se/post_model.dart';

class HttpService {
  final String postUrl = "https://api.publicapis.org/categories";
  Future<List<dynamic>> getPosts() async {
    Response res = await get(postUrl);

    if (res.statusCode == 200) {
      // print(res.body);
      // print(res.body.runtimeType);

      //parsing your json to string list
      List<String> stringList =
          (jsonDecode(res.body) as List<dynamic>).cast<String>();
      print(stringList);
      return stringList;

      // List<String> stringList =
      //     (jsonDecode(res.body) as List<dynamic>).cast<String>();

      // List<dynamic> body = jsonDecode(res.body);
      // List<Post> posts =
      //     body.map((dynamic item) => Post.fromJson(item)).toList();
      // print(body);
      // return posts;
    } else {
      throw "can't get Api";
    }
  }
}
