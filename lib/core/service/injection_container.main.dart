part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initHive();
  await _initDashboard();
}

Future<void> _initHive() async {
  Hive.registerAdapter(OfflinePostModelAdapter());
  final postBox = await Hive.openBox<OfflinePostModel>('offlinePostsBox');
  sl.registerLazySingleton(() => postBox);
}

Future<void> _initDashboard() async {
  
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDataSrcImpl(sl()),
  );

  sl.registerLazySingleton<PostLocalDatasource>(
    () => PostLocalDataSrcImpl(sl()),
  );

  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImplementation(sl(), sl()),
  );

  sl.registerLazySingleton(() => GetPostList(sl()));
  sl.registerLazySingleton(() => GetPostDetail(sl()));
  sl.registerLazySingleton(() => GetCommentList(sl()));

  sl.registerLazySingleton(() => AddOfflinePost(sl()));
  sl.registerLazySingleton(() => GetOfflinePosts(sl()));

  sl.registerFactory(
    () => PostCubit(getPostList: sl()),
  );

  sl.registerFactory(
    () => PostDetailCubit(getPostDetail: sl()),
  );

  sl.registerFactory(
    () => CommentCubit(getCommentList: sl()),
  );

  sl.registerFactory(
    () => OfflinePostCubit(
      addOfflinePost: sl(),
      getOfflinePosts: sl(),
    ),
  );
}