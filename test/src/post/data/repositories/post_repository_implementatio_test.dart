import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/src/post/data/models/comment_model.dart';
import 'package:flutter_tech_task/src/post/data/models/post_model.dart';
import 'package:flutter_tech_task/src/post/data/repositories/post_repository_implementatio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_tech_task/core/error/exceptions.dart';
import 'package:flutter_tech_task/core/error/failure.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_local_data_source.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_tech_task/src/post/data/models/offline_post_model.dart';

class MockPostRemoteDatasource extends Mock implements PostRemoteDatasource {}

class MockPostLocalDatasource extends Mock implements PostLocalDatasource {}

class FakeOfflinePostModel extends Fake implements OfflinePostModel {}

void main() {
  late PostRemoteDatasource remoteDatasource;
  late PostLocalDatasource localDatasource;
  late PostRepositoryImplementation repository;

  setUpAll(() {
    registerFallbackValue(FakeOfflinePostModel());
  });

  setUp(() {
    remoteDatasource = MockPostRemoteDatasource();
    localDatasource = MockPostLocalDatasource();
    repository = PostRepositoryImplementation(
      remoteDatasource,
      localDatasource,
    );
  });

  const tAPIException = APIException(message: 'Server Error', statusCode: 500);

  group('getPostList', () {
    final postList = [
      const PostModel(id: 1, userId: 1, title: "Title", body: "Body"),
    ];

    test(
      'should return List<Post> when remote data source call is successful',
      () async {
        // Arrange
        when(
          () => remoteDatasource.getPostList(),
        ).thenAnswer((_) async => postList);

        // Act
        final result = await repository.getPostList();

        // Assert
        expect(result, Right(postList));
        verify(() => remoteDatasource.getPostList()).called(1);
        verifyNoMoreInteractions(remoteDatasource);
      },
    );

    test(
      'should return [APIFailure] when remote data source call fails',
      () async {
        // Arrange
        when(() => remoteDatasource.getPostList()).thenThrow(tAPIException);

        // Act
        final result = await repository.getPostList();

        // Assert
        expect(result, Left(APIFailure.fromException(tAPIException)));
        verify(() => remoteDatasource.getPostList()).called(1);
        verifyNoMoreInteractions(remoteDatasource);
      },
    );
  });

  group('getPostDetail', () {
    const postId = 1;
    const postDetail = PostModel(
      id: 1,
      userId: 1,
      title: "Title",
      body: "Body",
    );

    test(
      'should return Post when remote data source call is successful',
      () async {
        // Arrange
        when(
          () => remoteDatasource.getPostDetail(id: postId),
        ).thenAnswer((_) async => postDetail);

        // Act
        final result = await repository.getPostDetail(id: postId);

        // Assert
        expect(result, const Right(postDetail));
        verify(() => remoteDatasource.getPostDetail(id: postId)).called(1);
        verifyNoMoreInteractions(remoteDatasource);
      },
    );

    test(
      'should return [APIFailure] when remote data source call fails',
      () async {
        // Arrange
        when(
          () => remoteDatasource.getPostDetail(id: postId),
        ).thenThrow(tAPIException);

        // Act
        final result = await repository.getPostDetail(id: postId);

        // Assert
        expect(result, Left(APIFailure.fromException(tAPIException)));
        verify(() => remoteDatasource.getPostDetail(id: postId)).called(1);
        verifyNoMoreInteractions(remoteDatasource);
      },
    );
  });

  group('getCommentList', () {
    const postId = 1;
    final commentList = [
      const CommentModel(
        id: 1,
        postId: 1,
        name: "John",
        email: "john@example.com",
        body: "Comment Body",
      ),
    ];

    test(
      'should return List<Comment> when remote data source call is successful',
      () async {
        // Arrange
        when(
          () => remoteDatasource.getCommentList(id: postId),
        ).thenAnswer((_) async => commentList);

        // Act
        final result = await repository.getCommentList(id: postId);

        // Assert
        expect(result, Right(commentList));
        verify(() => remoteDatasource.getCommentList(id: postId)).called(1);
        verifyNoMoreInteractions(remoteDatasource);
      },
    );

    test(
      'should return [APIFailure] when remote data source call fails',
      () async {
        // Arrange
        when(
          () => remoteDatasource.getCommentList(id: postId),
        ).thenThrow(tAPIException);

        // Act
        final result = await repository.getCommentList(id: postId);

        // Assert
        expect(result, Left(APIFailure.fromException(tAPIException)));
        verify(() => remoteDatasource.getCommentList(id: postId)).called(1);
        verifyNoMoreInteractions(remoteDatasource);
      },
    );
  });

  group('getOfflinePosts', () {

    test(
      'should return [APIFailure] when retrieving from local storage fails',
      () async {
        // Arrange
        when(() => localDatasource.getOfflinePosts()).thenThrow(tAPIException);

        // Act
        final result = await repository.getOfflinePosts();

        // Assert
        expect(result, Left(APIFailure.fromException(tAPIException)));
        verify(() => localDatasource.getOfflinePosts()).called(1);
        verifyNoMoreInteractions(localDatasource);
      },
    );
  });
}
