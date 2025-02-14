import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_tech_task/core/error/exceptions.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_local_data_source.dart';
import 'package:flutter_tech_task/src/post/data/models/offline_post_model.dart';

class FakeOfflinePostModel extends Fake implements OfflinePostModel {}

class MockHiveBox extends Mock implements Box<OfflinePostModel> {}

void main() {
  late PostLocalDatasource localDatasource;
  late MockHiveBox mockHiveBox;

  setUpAll(() {
    registerFallbackValue(FakeOfflinePostModel());
  });

  setUp(() {
    mockHiveBox = MockHiveBox();
    localDatasource = PostLocalDataSrcImpl(mockHiveBox);
  });

  group('addOfflinePost', () {
    final tPostModel = OfflinePostModel(id: 1, userId: 1, title: "Title", body: "Body");

    test('should store post in Hive box successfully', () async {
      // Arrange
      when(() => mockHiveBox.put(any(), any())).thenAnswer((_) async {});

      // Act
      await localDatasource.addOfflinePost(post: tPostModel);

      // Assert
      verify(() => mockHiveBox.put(tPostModel.id, tPostModel)).called(1);
      verifyNoMoreInteractions(mockHiveBox);
    });

    test('should throw APIException when storage fails', () async {
      // Arrange
      when(() => mockHiveBox.put(any(), any())).thenThrow(Exception());

      // Act
      final call = localDatasource.addOfflinePost;

      // Assert
      expect(() => call(post: tPostModel), throwsA(isA<APIException>()));
      verify(() => mockHiveBox.put(tPostModel.id, tPostModel)).called(1);
      verifyNoMoreInteractions(mockHiveBox);
    });
  });

  group('getOfflinePosts', () {
    final tPostModels = [OfflinePostModel(id: 1, userId: 1, title: "Title", body: "Body")];

    test('should return a list of offline posts from Hive box', () async {
      // Arrange
      when(() => mockHiveBox.values).thenReturn(tPostModels);

      // Act
      final result = await localDatasource.getOfflinePosts();

      // Assert
      expect(result, equals(tPostModels));
      verify(() => mockHiveBox.values).called(1);
      verifyNoMoreInteractions(mockHiveBox);
    });

    test('should throw APIException when storage fails', () async {
      // Arrange
      when(() => mockHiveBox.values).thenThrow(Exception());

      // Act
      final call = localDatasource.getOfflinePosts;

      // Assert
      expect(() => call(), throwsA(isA<APIException>()));
      verify(() => mockHiveBox.values).called(1);
      verifyNoMoreInteractions(mockHiveBox);
    });
  });
}
