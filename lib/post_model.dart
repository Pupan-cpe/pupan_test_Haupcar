import 'package:flutter/foundation.dart';

class Post {
  final String arr;
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.arr,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"] as int,
        id: json["id"] as int,
        body: json["body"] as String,
        arr: json[""] as String,
        title: json["title"] as String);
  }
}
