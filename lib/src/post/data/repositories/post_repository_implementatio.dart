import 'package:dartz/dartz.dart';
import 'package:flutter_tech_task/core/error/exceptions.dart';
import 'package:flutter_tech_task/core/error/failure.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_local_data_source.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_tech_task/src/post/data/models/offline_post_wrapper.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';

class PostRepositoryImplementation
    implements PostRepository {
  const PostRepositoryImplementation(this._remoteDataSource, this._localDataSource);

  final PostRemoteDatasource _remoteDataSource;
  final PostLocalDatasource _localDataSource;

  @override
  ResultFuture<List<Post>> getPostList() async {
    try {
      final result = await _remoteDataSource.getPostList();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Post> getPostDetail({required int id}) async {
    try {
      final result = await _remoteDataSource.getPostDetail(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
  
  @override
  ResultFuture<List<Comment>> getCommentList({required int id}) async{
    try {
      final result = await _remoteDataSource.getCommentList(id: id);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> addOfflinePost({required Post post}) async {
    try {
      final offlinePost = OfflinePostWrapper.toModel(post);
      await _localDataSource.addOfflinePost(post: offlinePost);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Post>> getOfflinePosts() async {
    try {
      final offlinePosts = await _localDataSource.getOfflinePosts();
      final entityPosts = OfflinePostWrapper.toEntityList(offlinePosts);
      return Right(entityPosts);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
  
}
