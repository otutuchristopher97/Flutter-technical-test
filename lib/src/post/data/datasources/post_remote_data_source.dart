import 'dart:convert';

import 'package:flutter_tech_task/core/error/exceptions.dart';
import 'package:flutter_tech_task/core/utils/constants.dart';
import 'package:flutter_tech_task/core/utils/typedef.dart';
import 'package:flutter_tech_task/src/post/data/models/comment_model.dart';
import 'package:flutter_tech_task/src/post/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getPostList();

  Future<PostModel> getPostDetail(
      {required int id});

  Future<List<CommentModel>> getCommentList(
      {required int id});
}

class PostRemoteDataSrcImpl implements PostRemoteDatasource {
  const PostRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<List<PostModel>> getPostList() async {
    
    var url = Uri.parse(ApiBaseUrl);

    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json'});
        // print(response.body);
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((postData) => PostModel.fromMap(postData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<PostModel> getPostDetail(
  {required int id}) async {
    
    var url = Uri.parse(ApiBaseUrl + id.toString());

    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return PostModel.fromMap(jsonDecode(response.body));
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CommentModel>> getCommentList(
  {required int id}) async {
    
    var url = Uri.parse(ApiBaseUrl+id.toString()+'/comments');

    try {
      final response =
          await _client.get(url,
              headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((commentData) => CommentModel.fromMap(commentData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

}
