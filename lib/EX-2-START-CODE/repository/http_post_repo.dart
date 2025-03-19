import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import '../post_dto/post_dto.dart';
import 'post_repository.dart';

class HttpPostRepository implements PostRepository {
  @override
  Future<Post> getPost(int postId) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // Convert JSON to PostDTO and then to Post
        return Post.fromDTO(PostDTO.fromJson(data));
      } else {
        throw Exception('Failed to fetch post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}
