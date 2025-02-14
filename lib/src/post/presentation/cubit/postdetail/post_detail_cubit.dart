import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/get_post_detail.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit({required GetPostDetail getPostDetail})
      : _getPostDetail = getPostDetail,
        super(const PostDetailInitial());

  final GetPostDetail _getPostDetail;

  Future<void> getPostDetailData({required int id}) async {
    emit(const LoadingPostDetail());

    final result = await _getPostDetail(PostDetailParams(id: id));

    result.fold(
      (failure) => emit(PostDetailError(failure.message)),
      (post) => emit(LoadedPostDetail(post)),
    );
  }
}
