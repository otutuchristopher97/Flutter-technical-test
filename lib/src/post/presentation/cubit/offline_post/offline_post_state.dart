part of 'offline_post_cubit.dart';

abstract class OfflinePostState extends Equatable {
  const OfflinePostState();

  @override
  List<Object> get props => [];
}

class OfflinePostInitial extends OfflinePostState {
  const OfflinePostInitial();
}

class LoadingOfflinePosts extends OfflinePostState {
  const LoadingOfflinePosts();
}

class LoadedOfflinePosts extends OfflinePostState {
  const LoadedOfflinePosts(this.posts);

  final List<Post> posts;

  @override
  List<Object> get props => [posts];
}

class AddingOfflinePost extends OfflinePostState {
  const AddingOfflinePost();
}

class OfflinePostAdded extends OfflinePostState {}

class OfflinePostError extends OfflinePostState {
  const OfflinePostError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
