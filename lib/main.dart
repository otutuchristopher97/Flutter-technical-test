import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/resources/themes.dart';
import 'package:flutter_tech_task/core/routing/router.dart';
import 'package:flutter_tech_task/core/service/injection_container.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/comment/comment_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/offline_post/offline_post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/post/post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/postdetail/post_detail_cubit.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (context) => sl<PostCubit>()..getPostListData(),
        ),
        BlocProvider<PostDetailCubit>(
          create: (context) => sl<PostDetailCubit>(),
        ),
        BlocProvider<CommentCubit>(
          create: (context) => sl<CommentCubit>(),
        ),
        BlocProvider<OfflinePostCubit>(
          create: (context) => sl<OfflinePostCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Technical Post App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: generateRoute,
        initialRoute: RouteConstants.splashScreen,
      ),
    );
  }
}