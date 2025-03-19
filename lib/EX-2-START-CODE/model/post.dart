import '../post_dto/post_dto.dart';

class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  factory Post.fromDTO(PostDTO dto) {
    return Post(
      id: dto.id,
      title: dto.title,
      description: dto.body, 
    );
  }
}