import 'dart:async';

import '../../../../core/data/network/dio/dio_client.dart';
import '../../../../domain/entity/post/post_list.dart';
import '../../constants/endpoints.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  PostApi(this._dioClient);

  /// Returns list of post in response
  Future<PostList> getPosts() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getPosts);
      return PostList.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }
}
