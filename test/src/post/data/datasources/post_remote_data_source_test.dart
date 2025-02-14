import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:flutter_tech_task/core/error/exceptions.dart';
import 'package:flutter_tech_task/core/utils/constants.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_tech_task/src/post/data/models/comment_model.dart';
import 'package:flutter_tech_task/src/post/data/models/post_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late PostRemoteDatasource remoteDatasource;

  setUp(() {
    client = MockHttpClient();
    remoteDatasource = PostRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group('getPostList', () {
    final postModels = [PostModel.empty()];
    const tAPIFailureMessage = 'API Failure';

    test('should return List<PostModel> when the status code is 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(
              jsonEncode(postModels.map((e) => e.toMap()).toList()), 200));

      // Act
      final result = await remoteDatasource.getPostList();

      // Assert
      expect(result, equals(postModels));
      verify(() => client.get(Uri.parse(ApiBaseUrl), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw APIException when the status code is not 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(tAPIFailureMessage, 400));

      // Act
      final call = remoteDatasource.getPostList;

      // Assert
      expect(() => call(), throwsA(isA<APIException>().having((e) => e.message, 'message', tAPIFailureMessage)));
      verify(() => client.get(Uri.parse(ApiBaseUrl), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('getPostDetail', () {
    const int postId = 1;
    final postModel = PostModel.empty();

    test('should return PostModel when the status code is 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(jsonEncode(postModel.toMap()), 200));

      // Act
      final result = await remoteDatasource.getPostDetail(id: postId);

      // Assert
      expect(result, equals(postModel));
      verify(() => client.get(Uri.parse('$ApiBaseUrl$postId'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw APIException when the status code is not 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('API Error', 404));

      // Act
      final call = remoteDatasource.getPostDetail;

      // Assert
      expect(() => call(id: postId), throwsA(isA<APIException>()));
      verify(() => client.get(Uri.parse('$ApiBaseUrl$postId'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('getCommentList', () {
    const int postId = 1;
    final commentModels = [CommentModel.empty()];

    test('should return List<CommentModel> when the status code is 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response(
              jsonEncode(commentModels.map((e) => e.toMap()).toList()), 200));

      // Act
      final result = await remoteDatasource.getCommentList(id: postId);

      // Assert
      expect(result, equals(commentModels));
      verify(() => client.get(Uri.parse('$ApiBaseUrl$postId/comments'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw APIException when the status code is not 200', () async {
      // Arrange
      when(() => client.get(any(), headers: any(named: 'headers')))
          .thenAnswer((_) async => http.Response('Error', 400));

      // Act
      final call = remoteDatasource.getCommentList;

      // Assert
      expect(() => call(id: postId), throwsA(isA<APIException>()));
      verify(() => client.get(Uri.parse('$ApiBaseUrl$postId/comments'), headers: any(named: 'headers'))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
