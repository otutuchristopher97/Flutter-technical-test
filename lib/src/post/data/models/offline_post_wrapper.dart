import 'package:flutter_tech_task/src/post/data/models/offline_post_model.dart';
import 'package:flutter_tech_task/src/post/domain/entities/post.dart';

class OfflinePostWrapper {
  /// Convert `Post` Entity → `PostModel`
  static OfflinePostModel toModel(Post entity) {
    return OfflinePostModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      body: entity.body,
    );
  }

  /// Convert `PostModel` (Hive) → `Post` Entity
  static Post toEntity(OfflinePostModel model) {
    return Post(
      id: model.id,
      userId: model.userId,
      title: model.title,
      body: model.body,
    );
  }

  /// Convert List<Post> → List<PostModel>
  static List<OfflinePostModel> toModelList(List<Post> entities) {
    return entities.map((post) => toModel(post)).toList();
  }

  /// Convert List<PostModel> → List<Post>
  static List<Post> toEntityList(List<OfflinePostModel> models) {
    return models.map((post) => toEntity(post)).toList();
  }
}
