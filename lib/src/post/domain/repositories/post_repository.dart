
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';

abstract class PostRepository {
  const PostRepository();

  ResultFuture<List<Post>> getPostList();
  ResultFuture<Post> getPostDetail(
      {required int id});
  ResultFuture<List<Comment>> getCommentList(
      {required int id});
  ResultFuture<void> addOfflinePost({required Post post});
  ResultFuture<List<Post>> getOfflinePosts();
}
