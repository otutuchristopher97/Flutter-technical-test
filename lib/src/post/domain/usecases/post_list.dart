import 'package:flutter_tech_task/core/usercase/usecase.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';

class GetPostList extends UsecaseWithoutParams<void> {
  const GetPostList(this._repository);

  final PostRepository _repository;

  @override
  ResultFuture call() async => _repository.getPostList();
}
