import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body,
      });

  const Post.empty()
      : this(
            id: 1,
            userId: 1,
            title: '_empty.title',
            body: '_empty.body',
            );

  final int id;
  final int userId;
  final String title;
  final String body;

  @override
  List<Object?> get props => [id, userId, title, body];
}