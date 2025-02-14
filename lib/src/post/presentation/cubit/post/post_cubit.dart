import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/post_list.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required GetPostList getPostList})
      : _getPostList = getPostList,
        super(const PostInitial());

  final GetPostList _getPostList;

  Future<void> getPostListData() async {
    emit(const LoadingPost());

    final result = await _getPostList();

    result.fold(
      (failure) => emit(PostError(failure.message)),
      (posts) => emit(LoadedPosts(posts)),
    );
  }
}
