import 'package:hive/hive.dart';
import 'package:flutter_tech_task/core/error/exceptions.dart';
import 'package:flutter_tech_task/src/post/data/models/offline_post_model.dart';

abstract class PostLocalDatasource {
  Future<void> addOfflinePost({required OfflinePostModel post});

  Future<List<OfflinePostModel>> getOfflinePosts();
}

class PostLocalDataSrcImpl implements PostLocalDatasource {
  const PostLocalDataSrcImpl(this._postBox);

  final Box<OfflinePostModel> _postBox;

  @override
  Future<void> addOfflinePost({required OfflinePostModel post}) async {
    try {
      await _postBox.put(post.id, post);
    } catch (e) {
      throw APIException(message: 'Failed to save offline post: ${e.toString()}', statusCode: 401);
    }
  }

  @override
  Future<List<OfflinePostModel>> getOfflinePosts() async {
    try {
      return _postBox.values.toList();
    } catch (e) {
      throw APIException(message: 'Failed to load offline posts: ${e.toString()}', statusCode: 401);
    }
  }
}
