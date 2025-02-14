import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  const Comment(
      {required this.id,
      required this.postId,
      required this.name,
      required this.email,
      required this.body,
      });

  const Comment.empty()
      : this(
            id: 1,
            postId: 1,
            name: '_empty.name',
            email: '_empty.email',
            body: '_empty.body',
            );

  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  @override
  List<Object?> get props => [id, postId, name, email, body];
}