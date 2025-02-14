import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tech_task/src/post/domain/entities/comment.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/get_comment_list.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit({required GetCommentList getCommentList})
      : _getCommentList = getCommentList,
        super(const CommentInitial());

  final GetCommentList _getCommentList;

  Future<void> getCommentListData({required int id}) async {
    emit(const LoadingComment());

    final result = await _getCommentList(CommentListParams(id: id));
    print(result);

    result.fold(
      (failure) => emit(CommentError(failure.message)),
      (comments) => emit(LoadedComments(comments)),
    );
  }
}
