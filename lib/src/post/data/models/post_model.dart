import 'dart:convert';

import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';

class PostModel extends Post {

  const PostModel({
      required super.id,
      required super.userId,
      required super.title,
      required super.body,
  });

  const PostModel.empty()
      : this(
            id: 1,
            userId: 1,
            title: '_empty.title',
            body: '_empty.body',
            );

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(jsonDecode(source));

  PostModel.fromMap(DataMap map)
      : this(
            id: map['id'] ?? 0,
            userId: map['userId'] ?? 0,
            title: map['title'] ?? "",
            body: map['body'] ?? "",
          );

  PostModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return PostModel(
      id: id ?? this.id, 
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  DataMap toMap() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };

  String toJson() => jsonEncode(toMap());
}
