import 'package:flutter_tech_task/core/usercase/usecase.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';

class GetOfflinePosts extends UsecaseWithoutParams<List<Post>> {
  const GetOfflinePosts(this._repository);

  final PostRepository _repository;

  @override
  ResultFuture<List<Post>> call() async => _repository.getOfflinePosts();
}
