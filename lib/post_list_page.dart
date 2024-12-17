import 'package:wordpress_flutter/post_card.dart';
import 'package:wordpress_flutter/service.dart';
import 'package:flutter/material.dart';

class PostListPage extends StatelessWidget {
  
  const PostListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Mes posts WP"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
          future: Service().posts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("Aucune Donnée"),
              );
            } else {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                  itemBuilder: (context, index) {
                    return PostCard(post: data[index]);
                  }
              );
            }
          }
      ),
    );
  }
}