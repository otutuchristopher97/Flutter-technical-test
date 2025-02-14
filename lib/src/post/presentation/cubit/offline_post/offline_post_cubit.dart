import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/add_offline_post.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/get_offline_posts.dart';

part 'offline_post_state.dart';

class OfflinePostCubit extends Cubit<OfflinePostState> {
  OfflinePostCubit({
    required AddOfflinePost addOfflinePost,
    required GetOfflinePosts getOfflinePosts,
  })  : _addOfflinePost = addOfflinePost,
        _getOfflinePosts = getOfflinePosts,
        super(const OfflinePostInitial());

  final AddOfflinePost _addOfflinePost;
  final GetOfflinePosts _getOfflinePosts;

  Future<void> fetchOfflinePosts() async {
    emit(const LoadingOfflinePosts());

    final result = await _getOfflinePosts();

    result.fold(
      (failure) => emit(OfflinePostError(failure.message)),
      (posts) => emit(LoadedOfflinePosts(posts)),
    );
  }

  Future<void> addOfflinePost({required Post post}) async {
    emit(const AddingOfflinePost());

    final result = await _addOfflinePost(AddOfflinePostParams(post: post));

    result.fold(
      (failure) => emit(OfflinePostError(failure.message)),
      (_) => emit(OfflinePostAdded()),
    );
  }
}
