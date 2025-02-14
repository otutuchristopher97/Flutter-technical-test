import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/core/usercase/usecase.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';

class AddOfflinePost extends UsecaseWithParams<void, AddOfflinePostParams> {
  const AddOfflinePost(this._repository);

  final PostRepository _repository;

  @override
  ResultFuture call(AddOfflinePostParams params) async =>
      _repository.addOfflinePost(post: params.post);
}

class AddOfflinePostParams extends Equatable {
  const AddOfflinePostParams({required this.post});

  final Post post;

  @override
  List<Object?> get props => [post];
}
