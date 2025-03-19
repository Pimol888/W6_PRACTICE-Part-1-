import 'package:flutter/material.dart';
import 'repository/http_post_repo.dart';
import 'package:provider/provider.dart';
import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});

  

  @override
  Widget build(BuildContext context) {

    // PostRepository postRepo = MockPostRepository();

    return ChangeNotifierProvider(
      create: (context) => PostProvider(repository: HttpPostRepository()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    );
  }
}
