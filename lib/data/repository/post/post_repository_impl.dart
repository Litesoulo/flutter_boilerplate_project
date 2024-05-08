import 'dart:async';

import 'package:sembast/sembast.dart';

import '../../../domain/entity/post/post.dart';
import '../../../domain/entity/post/post_list.dart';
import '../../../domain/repository/post/post_repository.dart';
import '../../local/constants/db_constants.dart';
import '../../local/datasources/post/post_datasource.dart';
import '../../network/apis/posts/post_api.dart';

class PostRepositoryImpl extends PostRepository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // constructor
  PostRepositoryImpl(this._postApi, this._postDataSource);

  // Post: ---------------------------------------------------------------------
  @override
  Future<PostList> getPosts() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getPosts().then((postsList) {
      postsList.posts?.forEach((post) {
        _postDataSource.insert(post);
      });

      return postsList;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  @override
  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);
}
