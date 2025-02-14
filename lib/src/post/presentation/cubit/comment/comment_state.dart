part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {
  const CommentInitial();
}

class LoadingComment extends CommentState {
  const LoadingComment();
}

class LoadedComments extends CommentState {
  const LoadedComments(this.comments);

  final List<Comment> comments;

  @override
  List<Object> get props => [comments.map((comment) => comment.id).toList()];
}

class CommentError extends CommentState {
  const CommentError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
