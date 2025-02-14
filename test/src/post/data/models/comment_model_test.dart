import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/data/models/comment_model.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';

void main() {
  const tModel = CommentModel.empty();

  test('should be a subclass of [Comment] entity', () {
    expect(tModel, isA<Comment>());
  });

  const tJson = '''
    {
      "id": 1,
      "postId": 1,
      "name": "_empty.name",
      "email": "_empty.email",
      "body": "_empty.body"
    }
  ''';
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [CommentModel] with the right data', () {
      final result = CommentModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [CommentModel] with the right data', () {
      final result = CommentModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [map] with the right data', () {
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with the right data', () {
      final result = tModel.toJson();
      expect(result, equals(jsonEncode(tMap)));
    });
  });

  group('copyWith', () {
    test('should return a [CommentModel] with modified data', () {
      final result = tModel.copyWith(name: 'Updated Name');
      expect(result.name, equals('Updated Name'));
    });
  });
}
