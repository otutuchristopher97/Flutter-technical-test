import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/core/usercase/usecase.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';

class GetPostDetail extends UsecaseWithParams<void, PostDetailParams> {
  const GetPostDetail(this._repository);

  final PostRepository _repository;

  @override
  ResultFuture call(PostDetailParams params) async =>
      _repository.getPostDetail(id: params.id);
}

class PostDetailParams extends Equatable {
  const PostDetailParams({required this.id});

  const PostDetailParams.empty() : this(id: 1);

  final int id;

  @override
  List<Object?> get props => [id];
}
