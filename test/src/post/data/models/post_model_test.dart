import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/data/models/post_model.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';

void main() {
  const tModel = PostModel.empty();

  test('should be a subclass of [Post] entity', () {
    expect(tModel, isA<Post>());
  });

  const tJson = '''
    {
      "id": 1,
      "userId": 1,
      "title": "_empty.title",
      "body": "_empty.body"
    }
  ''';
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [PostModel] with the right data', () {
      final result = PostModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [PostModel] with the right data', () {
      final result = PostModel.fromJson(tJson);
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
    test('should return a [PostModel] with modified data', () {
      final result = tModel.copyWith(title: 'New Title');
      expect(result.title, equals('New Title'));
    });
  });
}
