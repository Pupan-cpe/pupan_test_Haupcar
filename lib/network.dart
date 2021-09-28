import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

// import './post.dart';
// import 'package:pupan_haupcar_testing/post.dart';

Future<List<dynamic>> fetchPost() async {
  final response =
      await http.get(Uri.parse("https://api.publicapis.org/categories"));
  if (response.statusCode == 200) {
    List<dynamic> stringList =
        (jsonDecode(response.body) as List<dynamic>).cast<String>();
    // print(stringList);
    return stringList;

    // return compute(parsePost, response.body);
  } else {
    throw Exception("api error");
  }
}
