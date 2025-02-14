part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {
  const PostInitial();
}

class LoadingPost extends PostState {
  const LoadingPost();
}

class LoadedPosts extends PostState {
  const LoadedPosts(this.posts);

  final List<Post> posts;

  @override
  List<Object> get props => [posts.map((post) => post.id).toList()];
}

class PostError extends PostState {
  const PostError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
