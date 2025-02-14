import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/core/usercase/usecase.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';

class GetCommentList extends UsecaseWithParams<void, CommentListParams> {
  const GetCommentList(this._repository);

  final PostRepository _repository;

  @override
  ResultFuture call(CommentListParams params) async =>
      _repository.getCommentList(id: params.id);
}

class CommentListParams extends Equatable {
  const CommentListParams({required this.id});

  const CommentListParams.empty() : this(id: 1);

  final int id;

  @override
  List<Object?> get props => [id];
}
