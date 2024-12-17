import 'package:html/parser.dart';

class Post {
  String link;
  String title;
  String description;
  String content;
  List<dynamic> thumbnails;

  String get imageUrl {
    if (thumbnails.isEmpty) {
      return "";
    }
    final first = thumbnails.first as Map<String, dynamic>;
    return first["url"];
  }

  String get cardDescription {
    return parse(description).documentElement?.text ?? "";
  }

  Post({
    required this.title,
    required this.link,
    required this.content,
    required this.description,
    required this.thumbnails
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json["title"]["rendered"],
        link: json["link"],
        content: json["content"]["rendered"],
        description: json["excerpt"]["rendered"],
        thumbnails: json["yoast_head_json"]["og_image"]
    );
  }
}