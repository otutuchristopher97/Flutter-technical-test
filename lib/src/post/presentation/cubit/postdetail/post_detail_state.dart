part of 'post_detail_cubit.dart';

abstract class PostDetailState extends Equatable {
  const PostDetailState();

  @override
  List<Object> get props => [];
}

class PostDetailInitial extends PostDetailState {
  const PostDetailInitial();
}

class LoadingPostDetail extends PostDetailState {
  const LoadingPostDetail();
}

class LoadedPostDetail extends PostDetailState {
  const LoadedPostDetail(this.post);

  final Post post;

  @override
  List<Object> get props => [post];
}

class PostDetailError extends PostDetailState {
  const PostDetailError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
