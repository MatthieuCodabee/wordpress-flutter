import 'package:flutter/material.dart';
import 'package:wordpress_flutter/post.dart';
import 'package:wordpress_flutter/post_detail.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16
      ),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(post.imageUrl, fit: BoxFit.cover),
          Text(
            post.title,
            style: TextStyle(
              color: Colors.red,
              fontSize: 21,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Text(post.cardDescription),
          Padding(
            padding: EdgeInsets.all(12),
            child: ElevatedButton(
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) => PostDetail(post: post));
                  Navigator.of(context).push(route);
                }, 
                child: Text("En savoir plus")
            ),
          )
        ],
      ),
    );
  }

}