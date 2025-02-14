import 'package:hive/hive.dart';

part 'offline_post_model.g.dart';

@HiveType(typeId: 0)
class OfflinePostModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int userId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String body;

  OfflinePostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}
