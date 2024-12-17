import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wordpress_flutter/post.dart';

class Service {
  final String url = "https://www.codabee.com/wp-json/wp/v2/posts";

  Future<List<Post>> posts() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    List<dynamic> json = jsonDecode(response.body);
    List<Post> posts = json.map((e) => Post.fromJson(e)).toList();
    return posts;
  }
}