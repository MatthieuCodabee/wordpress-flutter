import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:wordpress_flutter/post.dart';
import 'package:fwfh_url_launcher/fwfh_url_launcher.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: HtmlWidget(
            post.content,
            factoryBuilder: () => LauncherFactory(),
          ),
        ),
      ),
    );
  }
}

class LauncherFactory extends WidgetFactory with UrlLauncherFactory {

}