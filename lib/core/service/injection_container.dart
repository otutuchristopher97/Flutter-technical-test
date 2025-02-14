
import 'package:flutter_tech_task/src/post/data/datasources/post_local_data_source.dart';
import 'package:flutter_tech_task/src/post/data/datasources/post_remote_data_source.dart';
import 'package:flutter_tech_task/src/post/data/models/offline_post_model.dart';
import 'package:flutter_tech_task/src/post/data/repositories/post_repository_implementatio.dart';
import 'package:flutter_tech_task/src/post/domain/repositories/post_repository.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/add_offline_post.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/get_comment_list.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/get_offline_posts.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/get_post_detail.dart';
import 'package:flutter_tech_task/src/post/domain/usecases/post_list.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/comment/comment_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/offline_post/offline_post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/post/post_cubit.dart';
import 'package:flutter_tech_task/src/post/presentation/cubit/postdetail/post_detail_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

part 'injection_container.main.dart';
