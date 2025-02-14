import 'dart:convert';

import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';

class CommentModel extends Comment {

  const CommentModel({
      required super.id,
      required super.postId,
      required super.name,
      required super.email,
      required super.body,
  });

  const CommentModel.empty()
      : this(
            id: 1,
            postId: 1,
            name: '_empty.name',
            email: '_empty.email',
            body: '_empty.body',
            );

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(jsonDecode(source));

  CommentModel.fromMap(DataMap map)
      : this(
            id: map['id'] ?? 0,
            postId: map['postId'] ?? 0,
            name: map['name'] ?? '',
            email: map['email'] ?? '',
            body: map['body'] ?? '',
          );

  CommentModel copyWith({
    int? id,
    int? postId,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentModel(
      id: id ?? this.id, 
      postId: postId ?? this.postId,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  DataMap toMap() => {
        'id': id,
        'postId': postId,
        'name': name,
        'email': email,
        'body': body,
      };

  String toJson() => jsonEncode(toMap());
}
